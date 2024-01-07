import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final String barbershopName;
  final String selectedHairstyle;

  BookingScreen({required this.barbershopName, required this.selectedHairstyle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking - $barbershopName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Hairstyle: $selectedHairstyle',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement booking logic
                // For simplicity, show a success message and navigate back to the main screen
                _showSuccessMessage(context);
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Successful'),
          content: Text('Your appointment for $selectedHairstyle at $barbershopName has been booked successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate back to the main screen
                Navigator.popUntil(context, ModalRoute.withName('/main'));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

}
