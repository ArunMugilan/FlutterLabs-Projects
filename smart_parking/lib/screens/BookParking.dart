import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'History.dart';

class BookParking extends StatefulWidget {
  final String parkingSpot;

  const BookParking({required this.parkingSpot, Key? key}) : super(key: key);

  @override
  _BookParkingState createState() => _BookParkingState();
}

class _BookParkingState extends State<BookParking> {
  final _formKey = GlobalKey<FormState>();
  String _selectedVehicleType = 'Car';
  String _vehiclePlateNumber = '';
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  double _parkingCharge = 0.0;
  bool _isBooking = false;

  // Define parking charges based on vehicle type
  final Map<String, double> _vehicleTypeCharges = {
    'Motorcycle': 5.0,
    'Car': 10.0,
    'Lorry': 15.0,
    'Van': 12.0,
  };

  void _calculateParkingCharge() {
    double rate = _vehicleTypeCharges[_selectedVehicleType] ?? 0.0;
    int hours = _endTime.hour - _startTime.hour;
    double charge = rate * hours;
    setState(() {
      _parkingCharge = charge;
    });
  }

  Future<void> _performBooking() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isBooking = true;
      });

      final url = Uri.https(
        'smartparkingappdb-default-rtdb.asia-southeast1.firebasedatabase.app',
        'book-parking.json',
      );
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'vehicle-type': _selectedVehicleType,
            'plate-number': _vehiclePlateNumber,
            'start-time': _startTime.toString(),
            'end-time': _endTime.toString(),
            'charge': _parkingCharge,
          },
        ),
      );

      print(response.body);
      print(response.statusCode);

      // Handle response as needed

      // Reset the form
      _formKey.currentState!.reset();

      // Navigate to the history screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HistoryPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Parking'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Selected Parking Spot: ${widget.parkingSpot}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdownButtonFormField(
                      value: _selectedVehicleType,
                      items: _vehicleTypeCharges.keys
                          .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(
                                  type,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedVehicleType = value.toString();
                        });
                        _calculateParkingCharge();
                      },
                      decoration: const InputDecoration(
                        labelText: 'Vehicle Type',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _vehiclePlateNumber = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Vehicle Plate Number',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the vehicle plate number';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Start Time: $_startTime',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: _startTime,
                            );
                            if (pickedTime != null) {
                              setState(() {
                                _startTime = pickedTime;
                              });
                              _calculateParkingCharge();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'End Time: $_endTime',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: _endTime,
                            );
                            if (pickedTime != null) {
                              setState(() {
                                _endTime = pickedTime;
                              });
                              _calculateParkingCharge();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Parking Charge: RM $_parkingCharge',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _isBooking
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: _isBooking ? null : _performBooking,
                      child: _isBooking
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Book'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}