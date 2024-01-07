import 'package:flutter/material.dart';
import 'package:labtest_flutter/new_student.dart';
import 'package:labtest_flutter/student_list.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation Mobile App',
      home: StudentDetails(),
    );

  }
}