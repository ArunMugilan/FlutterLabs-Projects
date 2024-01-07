import 'package:flutter/material.dart';
import 'package:umtbarberapp/menuScreen.dart';
import 'loginScreen.dart';
import 'mainScreen.dart';
import 'nearbyBarberScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbershop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainScreen(),
        '/nearby': (context) => NearbyBarbershop(), // Add route for Nearby Barbershop
        '/hairstyle': (context) => HairstyleMenu(barbershopName: '',),
      },
    );
  }
}
