import 'package:flutter/material.dart';
import 'bookingScreen.dart';

class HairstyleMenu extends StatelessWidget {
  final String barbershopName;

  HairstyleMenu({required this.barbershopName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hairstyle Menu - $barbershopName'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Hairstyle 1'),
            subtitle: Text('RM 10'),
            onTap: () {
              // Handle selection for Hairstyle 1
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(
                    barbershopName: barbershopName,
                    selectedHairstyle: 'Hairstyle 1',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Hairstyle 2'),
            subtitle: Text('RM 15'),
            onTap: () {
              // Handle selection for Hairstyle 2
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(
                    barbershopName: barbershopName,
                    selectedHairstyle: 'Hairstyle 2',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Hairstyle 3'),
            subtitle: Text('RM 30'),
            onTap: () {
              // Handle selection for Hairstyle 2
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(
                    barbershopName: barbershopName,
                    selectedHairstyle: 'Hairstyle 3',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the main screen
            Navigator.pop(context);
          },
          child: Text('Back to Main'),
        ),
      ),
    );
  }
}
