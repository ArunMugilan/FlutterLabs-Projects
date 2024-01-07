import 'package:flutter/material.dart';
import 'package:yt_tutorial/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int crtPage = 0;

  @override
  Widget build(BuildContext context) {
    int selectedIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube Tutorial'),
      ),
      body: const HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FloatingActionButton');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        ],
        onDestinationSelected: (int index){
          setState(() {
            crtPage = index;
          });
        },
        selectedIndex: selectedIndex = crtPage,
      ),
    );
  }
}
