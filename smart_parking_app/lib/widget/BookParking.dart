import 'package:flutter/material.dart';
import 'Login.dart';
import 'Register.dart';

class BookParking extends StatefulWidget {
  final String parkingSpot;

  const BookParking({required this.parkingSpot, Key? key}) : super(key: key);

  @override
  _BookParkingState createState() => _BookParkingState();
}

class _BookParkingState extends State<BookParking> {
  String _selectedVehicleType = 'Car';
  String _vehiclePlateNumber = '';
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  double _parkingCharge = 0.0;

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

  void _bookParking() {
    // Add your booking logic here
    // You can use the gathered information to book the parking spot
    // For simplicity, this example just prints the booking details
    print('Selected Parking Spot: ${widget.parkingSpot}');
    print('Vehicle Type: $_selectedVehicleType');
    print('Vehicle Plate Number: $_vehiclePlateNumber');
    print('Start Time: $_startTime');
    print('End Time: $_endTime');
    print('Parking Charge: $_parkingCharge');
    // Add navigation or any further actions after booking
  }

  void _userRegistration() {
    // Show a dialog with two buttons: "Register Account" and "Log In"
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Required'),
          content: Text('To proceed, you need to have an account or log in.'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate to the Register screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Register Account'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the Login screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Log In'),
            ),
          ],
        );
      },
    );
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ElevatedButton(
                onPressed: _userRegistration,
                child: Text('Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}