// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'parking_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Parking App'),
      ),
      body: ParkingScreen(),
    );
  }
}
