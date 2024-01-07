// lib/screens/parking_screen.dart
import 'package:flutter/material.dart';
import 'package:smart_parking_app/old/parking_lot.dart';

class ParkingScreen extends StatefulWidget {
  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParkingLot(),
    );
  }
}
