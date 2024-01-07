import 'package:flutter/material.dart';
import 'screen3.dart';

/*class Screen2 extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.red,
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return Screen3();
              }),
            );
          },
          child: Text('Go To Screen 3'),
        ),
      ),
    );
  }
}*/ //code for 1.2 to 1.5 (lab7)

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Staff Number 1'),
            subtitle: Text('Department W'),
            trailing: Icon(Icons.arrow_forward),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Staff Number 2'),
            subtitle: Text('Department X'),
            trailing: Icon(Icons.arrow_forward),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Staff Number 3'),
            subtitle: Text('Department Y'),
            trailing: Icon(Icons.arrow_forward),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Staff Number 4'),
            subtitle: Text('Department Z'),
            trailing: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 50),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Employee Details Screen'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the first screen
                  },
                  child: Text('Back to First Screen'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );
                  },
                  child: Text('Go to Vote Screen'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}