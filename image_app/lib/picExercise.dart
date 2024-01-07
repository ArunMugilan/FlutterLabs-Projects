/* Arun Mugilan A/L Sargunan
S63746
29/10/2023
Exercise 3.4 */

import 'package:flutter/material.dart';

void main() {
  runApp(PicApp());
}

class PicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PicPage(),
    );
  }
}

class PicPage extends StatefulWidget {
  @override
  _PicPageState createState() => _PicPageState();
}

class _PicPageState extends State<PicPage> {
  bool showPicture1 = false;

  void togglePicture() {
    setState(() {
      showPicture1 = !showPicture1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Viewer'),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showPicture1
                ? Image.asset('images/pic1.png')
                : Image.asset('images/pic2.png'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                togglePicture();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              child: Text('Show Picture 1'),
            ),
            ElevatedButton(
              onPressed: () {
                togglePicture();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              child: Text('Show Picture 2'),
            ),
          ],
        ),
      ),
    );
  }
}
