import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Student Data Entry',
      home: StudentDataEntry(),
    );
  }
}

class StudentDataEntry extends StatefulWidget {
  const StudentDataEntry({super.key});

  @override
  _StudentDataEntryState createState() => _StudentDataEntryState();
}

class _StudentDataEntryState extends State<StudentDataEntry> {
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: studentNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Student Name',
                  hintText: 'Enter student name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter student name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.book),
                  labelText: 'Course',
                  hintText: 'Enter course name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter course name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String studentName = studentNameController.text;
      String course = courseController.text;
      _showDialog('Student Data Entry', 'Student Name: $studentName\nCourse: $course');
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
