import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'Dashboard.dart';
import 'package:smart_parking/models/users.dart';

class AddParkingPage extends StatefulWidget {
  final User user;

  const AddParkingPage({Key? key, required this.user}) : super(key: key);

  @override
  _AddParkingPageState createState() => _AddParkingPageState();
}

class _AddParkingPageState extends State<AddParkingPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberOfParkingController =
      TextEditingController();
  File? _selectedImage;
  final _formKey = GlobalKey<FormState>();
  bool _isAddingSpot = false;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _addParking() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isAddingSpot = true;
      });

      if (_selectedImage == null) {
        // Handle the case where no image is selected
        print('No image selected');
        return;
      }

      try {
        List<int> imageBytes = await _selectedImage!.readAsBytes();

        final url = Uri.https(
          'smartparkingappdb-default-rtdb.asia-southeast1.firebasedatabase.app',
          'add-parking.json',
        );

        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'address': _addressController.text,
              'nOfSpots': int.parse(_numberOfParkingController.text),
              'image': base64Encode(imageBytes),
            },
          ),
        );

        print(response.body);
        print(response.statusCode);

        // Handle response as needed

        // Reset the form
        _formKey.currentState!.reset();

        // Navigate to the dashboard screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(
              user: widget.user,
            ),
          ),
        );
      } catch (e) {
        print('Error adding parking spot: $e');
        // Handle the error (show a snackbar, etc.)
      } finally {
        setState(() {
          _isAddingSpot = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _numberOfParkingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Parking Lots',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : Container(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _getImage(),
              child: const Text('Attach Picture'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _isAddingSpot
                      ? null
                      : () {
                          _formKey.currentState!.reset();
                        },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _isAddingSpot ? null : _addParking,
                  child: _isAddingSpot
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
