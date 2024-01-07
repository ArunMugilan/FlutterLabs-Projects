import 'package:flutter/material.dart';
import 'new_student.dart';

class RecordsList extends StatelessWidget {
  late final List<Map<String, dynamic>> donations;

  RecordsList({required this.donations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Donor Records'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: donations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Name: ${donations[index]['name']}'),
            subtitle: Text('Matrics Number: ${donations[index]['matricsNum']}\n'
                'Blood Category: ${donations[index]['bloodCategory']}'),
          );
        },
      ),
    );
  }
}
