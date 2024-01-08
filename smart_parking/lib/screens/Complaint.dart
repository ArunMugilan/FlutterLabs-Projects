import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:smart_parking/themes/ColourThemes.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({Key? key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final _formKey = GlobalKey<FormState>();
  var _complaint = '';
  var _isRegistering = false;
  List<String> _complaints = [];

  void _addComplaint() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isRegistering = true;
      });
      _formKey.currentState!.save();

      // Perform registration logic here, e.g., send data to a server
      final url = Uri.https(
        'smartparkingappdb-default-rtdb.asia-southeast1.firebasedatabase.app',
        'complaints.json',
      );
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'complaint': _complaint,
          },
        ),
      );

      print(response.body);
      print(response.statusCode);

      // Handle response as needed

      // Update the list of complaints
      setState(() {
        _complaints.add(_complaint);
      });

      // Reset the form
      _formKey.currentState!.reset();
    }
  }

  void _deleteComplaint(int index) async {
    setState(() {
      _isRegistering = true;
    });

    // Get the complaint ID or some unique identifier from the list
    String complaintId = _complaints[index]; // Replace this with the actual way you identify complaints

    // Perform deletion logic here, e.g., send delete request to the server
    final url = Uri.https(
      'smartparkingappdb-default-rtdb.asia-southeast1.firebasedatabase.app',
      'complaints/$complaintId.json', // Append the complaint ID to the URL
    );

    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.body);
    print(response.statusCode);

    // Handle response as needed

    // Update the list of complaints
    setState(() {
      _complaints.removeAt(index);
      _isRegistering = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c5,
        centerTitle: true,
        title: Text(
          'Submit a Complaint',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: c1,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  // Add input fields for the user to submit complaints
                  // For example, a TextFormField and a Submit button
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      onSaved: (value) {
                        _complaint = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your complaint';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Type your complaint here',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _isRegistering ? null : _addComplaint,
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: c5,
                    ),
                    child: Text('Submit', style: TextStyle(color: c1),),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _complaints.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_complaints[index]),
                  onDismissed: (direction) {
                    _deleteComplaint(index);
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 16.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    title: Text(_complaints[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
