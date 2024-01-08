// import 'package:flutter/material.dart';
// import 'BookParking.dart';
// import 'Login.dart';
// import 'Register.dart';
//
// class NearbyParking extends StatelessWidget {
//   // Placeholder data for available parking spots
//   final List<String> availableParkingSpots = List.generate(50, (index) => 'Spot ${index + 1}');
//
//   NearbyParking({super.key});
//
//   // void _userRegistration() {
//   //   // Show a dialog with two buttons: "Register Account" and "Log In"
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text('Account Required'),
//   //         content: Text('To proceed, you need to have an account or log in.'),
//   //         actions: [
//   //           TextButton(
//   //             onPressed: () {
//   //               // Navigate to the Register screen
//   //               Navigator.push(
//   //                 context,
//   //                 MaterialPageRoute(builder: (context) => RegisterScreen()),
//   //               );
//   //             },
//   //             child: Text('Register Account'),
//   //           ),
//   //           TextButton(
//   //             onPressed: () {
//   //               // Navigate to the Login screen
//   //               Navigator.push(
//   //                 context,
//   //                 MaterialPageRoute(builder: (context) => LoginScreen()),
//   //               );
//   //             },
//   //             child: Text('Log In'),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nearby Parking'),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Number of Available Parking Spots: ${availableParkingSpots.length}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 16),
//             // Replace the following Container with your map implementation
//             Container(
//               height: 200,
//               color: Colors.grey[300], // Placeholder for map
//               child: const Center(
//                 child: Text('Map Placeholder'),
//               ),
//             ),
//             SizedBox(height: 16),
//             const Text(
//               'Available Parking Spots:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: availableParkingSpots.length,
//                 itemBuilder: (context, index) {
//                   final String parkingSpot = availableParkingSpots[index];
//                   return ListTile(
//                     title: Text(parkingSpot),
//                     onTap: () {
//                       // Navigate to BookParking screen when a parking spot is tapped
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const BookParking(parkingSpot: '',)),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smart_parking/models/ParkingSpot.dart';
import 'BookParking.dart';
import 'ParkingDetails.dart';

class NearbyParking extends StatefulWidget {
  @override
  _NearbyParkingState createState() => _NearbyParkingState();
}

class _NearbyParkingState extends State<NearbyParking> {
  List<ParkingSpot> parkingSpots = [
    ParkingSpot(
        id: '1',
        address: '123 Main St',
        numberOfParkingLots: 10,
        imageUrl: 'parking1.jpg'),
    ParkingSpot(
        id: '2',
        address: '456 Oak St',
        numberOfParkingLots: 15,
        imageUrl: 'parking2.jpg'),
    // Add more parking spots as needed
  ];

  List<ParkingSpot> filteredParkingSpots = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    filteredParkingSpots = parkingSpots;
    super.initState();
  }

  void searchParking(String query) {
    setState(() {
      filteredParkingSpots = parkingSpots
          .where((spot) => spot.address.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Parking'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: searchParking,
              decoration: InputDecoration(
                labelText: "Search Parking",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredParkingSpots.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredParkingSpots[index].address),
                  subtitle: Text(
                      'Available lots: ${filteredParkingSpots[index].numberOfParkingLots}'),
                  leading: Image.network(
                    filteredParkingSpots[index].imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParkingDetails(
                            parkingSpot: filteredParkingSpots[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
