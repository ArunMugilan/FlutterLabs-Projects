
/*
* ARUN MUGILAN A/L SARGUNAN
* S63746
* LAB 6
*/


import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyMainPage(),
    ));

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  List<String> _todoRecords = ['Task 1', 'Task 2', 'Task 3', 'Task 4'];

  void _addingToDo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newToDO = "";
        return AlertDialog(
          title: Text('Enter New Task Below: '),
          content: TextField(
            onChanged: (value) {
              newToDO = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todoRecords.add(newToDO);
                });
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arun -A To-Do List'),
        centerTitle: true,
        backgroundColor: Colors.black54, // Set app bar color
      ),
      body: ListView.builder(
        itemCount: _todoRecords.length,
        itemBuilder: (context, index) {
          final toDo = _todoRecords[index];
          return Card(
            margin: EdgeInsets.all(15),
            color: Colors.blueGrey, // Set list tile color
            child: ListTile(
              title: Center(
                child: Text(
                  toDo,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                setState(() {
                  _todoRecords.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addingToDo,
        backgroundColor: Colors.black45, // Set button color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
