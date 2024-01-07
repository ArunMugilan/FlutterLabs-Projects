// lib/screens/AddParking.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddParkingPage extends StatefulWidget {
  @override
  _AddParkingPageState createState() => _AddParkingPageState();
}

class _AddParkingPageState extends State<AddParkingPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberOfParkingController =
  TextEditingController();
  File? _selectedImage;

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _addParking() {
    // Implement your logic to store the data, including the image file
    // You can access the entered text from _addressController and _numberOfParkingController
    // You can access the image file from _selectedImage
    // Implement your logic to store the data, such as sending it to a server or saving it locally.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Parking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _numberOfParkingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of Parking Lots'),
            ),
            SizedBox(height: 16),
            _selectedImage != null
                ? Image.file(
              _selectedImage!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )
                : Container(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _getImage(),
              child: Text('Attach Picture'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _addParking(),
              child: Text('Add Parking'),
            ),
          ],
        ),
      ),
    );
  }
}
