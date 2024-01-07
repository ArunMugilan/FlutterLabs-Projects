import 'package:flutter/material.dart';
import 'menuScreen.dart';

class NearbyBarbershop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Barbershops'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Barbershop 1'),
            subtitle: Text('Address 1'),
            onTap: () {
              // Handle selection for Barbershop 1
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HairstyleMenu(barbershopName: 'Barbershop 1')),
              );
            },
          ),
          ListTile(
            title: Text('Barbershop 2'),
            subtitle: Text('Address 2'),
            onTap: () {
              // Handle selection for Barbershop 2
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HairstyleMenu(barbershopName: 'Barbershop 2')),
              );
            },
          ),
          // Add more nearby barbershops as needed
        ],
      ),
    );
  }
}
