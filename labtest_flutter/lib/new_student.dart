import 'package:flutter/material.dart';
import 'student_list.dart';

class StudentDetails extends StatefulWidget {
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController matricsNumController = TextEditingController();
  String selectedBloodCategory = "A+";

  List<Map<String, dynamic>> donations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation App'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: matricsNumController,
              decoration: InputDecoration(labelText: 'Matrics Number'),
            ),
            DropdownButton<String>(
              value: selectedBloodCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedBloodCategory = newValue!;
                });
              },
              items: <String>['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
                  .map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                submitData(context);
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecordsList(donations: donations),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text('View Students'),
            ),
          ],
        ),
      ),
    );
  }

  void submitData(BuildContext context) {
    String name = nameController.text;
    String matricsNum = matricsNumController.text;

    Map<String, dynamic> donation = {
      'name': name,
      'matricsNum': matricsNum,
      'bloodCategory': selectedBloodCategory,
    };

    setState(() {
      donations.add(donation);
    });

    // Clear text fields after submission
    nameController.clear();
    matricsNumController.clear();

    // Navigate to the Donation Records screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordsList(donations: donations),
      ),
    );
  }
}
