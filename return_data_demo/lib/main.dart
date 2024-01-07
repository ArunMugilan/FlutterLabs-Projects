import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _matricNo = 'None';
  String _fullName = 'None';

  _userRegister() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DataEntryScreen()),
    );
    print("#Debug main.dart: Passing await...");
    if (result != null) {
      setState(() {
        _matricNo = result['matricNo'] ?? 'None';
        _fullName = result['fullName'] ?? 'None';
      });
      print('#Debug main.dart: _matricNo = $_matricNo, _fullName = $_fullName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 1.4'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Matric No: $_matricNo"),
            Text("Full Name: $_fullName"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _userRegister,
              child: Text('Register Options'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataEntryScreen extends StatefulWidget {
  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  TextEditingController matricNoController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 1.4'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: matricNoController,
              decoration: InputDecoration(labelText: 'Matric No.'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String matricNo = matricNoController.text;
                String fullName = fullNameController.text;

                Navigator.pop(
                  context,
                  {'matricNo': matricNo, 'fullName': fullName},
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
