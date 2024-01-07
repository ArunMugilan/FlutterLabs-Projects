import 'package:flutter/material.dart';
import 'screen3.dart';
import 'screen2.dart';

/*class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.black,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/first',);
              },
              child: Text('Go To Screen 2'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/second',);
              },
              child: Text('Go To Screen 3'),
            ),
          ],
        ),
      ),
    );
  }
}*/ //code for 1.2 to 1.5 (lab7)

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABC Sdn Bhd e-Voting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: Text('1) Employee Details'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen3()),
                );
              },
              child: Text('2) Vote the Candidate'),
            ),
          ],),),);}}
