import 'package:drawer_demo/productScreeen.dart';
import 'package:drawer_demo/stockScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo using Drawer'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('My Main Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 60.0,
              child: const DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(color: Colors.purple),
              ),
            ),
            ListTile(
              title: const Text('Products'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Stock'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StockScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

