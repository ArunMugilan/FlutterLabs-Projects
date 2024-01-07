import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Roborto'),
      home: MyMainUI(),
    );
  }
}

class MyMainUI extends StatefulWidget {
  const MyMainUI({super.key});

  @override
  State<MyMainUI> createState() => _MyMainUIState();
}

class _MyMainUIState extends State<MyMainUI> {
  TextEditingController matricno = TextEditingController();
  TextEditingController fullname = TextEditingController();

  @override
  void initState() {
    matricno.text = "";
    fullname.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo List, Label & Textfield"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            TextField(
                controller: matricno,
                decoration: const InputDecoration(
                  labelText: "Matric No.",
                  hintText: "Enter your matric no.",
                  prefixIcon: Icon(Icons.person, size: 30),
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  labelStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
                )),
            const SizedBox(height: 20),
            TextField(
                controller: fullname,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "Enter your full name",
                  prefixIcon: Icon(Icons.abc, size: 30),
                  hintStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  labelStyle:
                      const TextStyle(fontSize: 15, color: Colors.redAccent),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  maximumSize: const Size(200, 40),
                ),
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
