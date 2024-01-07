// lib/screens/parking_lot.dart
import 'package:flutter/material.dart';

class ParkingLot extends StatefulWidget {
  @override
  _ParkingLotState createState() => _ParkingLotState();
}

class _ParkingLotState extends State<ParkingLot> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Parking Lot',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
