// lib/screens/parking_space_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'NearbyParking.dart';
import 'BookParking.dart'; // Import BookParking.dart

class ParkingSpacePage extends StatelessWidget {
  final LatLng initialCameraPosition =
  LatLng(37.7749, -122.4194); // Replace with your default location
  final String mapUrl =
      'https://www.google.com/maps'; // Replace with your desired map URL

  void _launchGoogleMaps() async {
    if (await canLaunchUrl(mapUrl as Uri)) {
      await launchUrl(mapUrl as Uri);
    } else {
      throw 'Could not launch $mapUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              elevation: 5,
              child: InkWell(
                onTap: _launchGoogleMaps,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition:
                    CameraPosition(target: initialCameraPosition, zoom: 14),
                    markers: {
                      Marker(
                          markerId: MarkerId('1'),
                          position: initialCameraPosition),
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to the NearbyParkingPage
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NearbyParking()));
            },
            child: Text('Nearby Parking'),
          ),
          SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number of Available Parking Spots: 50', // Replace with dynamic data
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                // Replace the following Container with your map implementation
              ],
            ),
          ),
        ],
      ),
    );
  }
}
