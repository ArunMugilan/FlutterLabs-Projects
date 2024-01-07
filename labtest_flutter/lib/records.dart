import 'package:flutter/material.dart';
import 'student_list.dart';

class RecordList extends StatefulWidget {
  const RecordList({super.key});

  @override
  State<RecordList> createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      const Text(
        'Donation Records:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: donations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Name: ${donations[index]['name']}'),
              subtitle: Text('Matrics Number: ${donations[index]['matricsNum']}\n'
                  'Blood Category: ${donations[index]['bloodCategory']}'),
            );
          },
        ),
      ),
    );
  }
}
