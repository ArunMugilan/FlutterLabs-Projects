// lib/screens/NearbyParking.dart
import 'package:flutter/material.dart';
import 'BookParking.dart';

class NearbyParking extends StatelessWidget {
  // Placeholder data for available parking spots
  final List<String> availableParkingSpots = List.generate(50, (index) => 'Spot ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Parking'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of Available Parking Spots: ${availableParkingSpots.length}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // Replace the following Container with your map implementation
            Container(
              height: 200,
              color: Colors.grey[300], // Placeholder for map
              child: const Center(
                child: Text('Map Placeholder'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Available Parking Spots:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: availableParkingSpots.length,
                itemBuilder: (context, index) {
                  final String parkingSpot = availableParkingSpots[index];
                  return ListTile(
                    title: Text(parkingSpot),
                    onTap: () {
                      // Navigate to BookParking screen when a parking spot is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookParking(parkingSpot: '',)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
