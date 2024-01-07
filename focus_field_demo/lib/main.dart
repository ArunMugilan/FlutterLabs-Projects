import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Roborto'),
      home: MyMainUI(),
    );
  }
}

class MyMainUI extends StatefulWidget{
  const MyMainUI({super.key});
  
  @override
  State<MyMainUI> createState() => _MyMainUIState();
}

class _MyMainUIState extends State<MyMainUI>{
  late FocusNode currentFocus;
  
  @override
  void initState(){
    super.initState();
    currentFocus = FocusNode();
  }

  @override
  void dispose(){
    currentFocus.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Focus'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Autofocus is set'),
              autofocus: true,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'currentFocus is trigger'),
              focusNode: currentFocus,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Data 3'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          currentFocus.requestFocus();
        },
        tooltip: 'Click this button to trigger focus on TextField 2..!',
        child: const Icon(Icons.star),
      ),
    );
  }
  
}
