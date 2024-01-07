/*
*........................
Author: Arun Mugilan
Date: 29/10/2023
Program: Bachelor of Computer Science (Mobile Computing)
*.........................
*/


import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      home: Scaffold(
            backgroundColor: Colors.blueGrey[500],
            appBar: AppBar(
              title: Text("My Application"),
              centerTitle: true,
              backgroundColor: Colors.blueGrey[900],
            ),
         body: Center(
         child: Image(
           image: AssetImage(
             'images/background1.png'
           ),
         ),),
)));
