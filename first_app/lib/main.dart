import 'package:flutter/material.dart';

void main() {
  var your_name = "Arun";
  runApp(Center(
    child: Text(
      "Welcome to my flutter app, $your_name",
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.orangeAccent, fontSize: 20, fontStyle: FontStyle.italic),
    )
  ));
}

