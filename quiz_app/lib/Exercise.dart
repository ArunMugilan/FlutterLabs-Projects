import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap gesture here
        print("Button tapped!");
      },
      child: Container(
        width: 200,
        height: 100,
        color: Colors.black,
        alignment: Alignment.center,
        child: Text(
          "Click Me",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gesture Detection Implementation'),
        ),
        body: Center(
          child: MyCustomWidget(),
        ),
      ),
    );
  }
}
