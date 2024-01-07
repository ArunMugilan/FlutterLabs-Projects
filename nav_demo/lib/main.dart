import 'package:flutter/material.dart';
import 'screen1.dart';


void main() => runApp(MyApp());

/*class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Screen1(),
        '/first': (context) => Screen2(),
        '/second': (context) => Screen3(),
      },
    );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC Sdn Bhd e-Voting',
      home: Screen1(),
    );
  }
}

