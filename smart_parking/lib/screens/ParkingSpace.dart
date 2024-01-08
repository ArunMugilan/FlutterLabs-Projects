// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import 'package:smart_parking/themes/ColourThemes.dart';
// import 'NearbyParking.dart';
// import 'BookParking.dart';
//
// class ParkingSpacePage extends StatelessWidget {
//   late GoogleMapController mapController;
//   final LatLng initialCameraPosition =
//       const LatLng(37.7749, -122.4194); // Replace with your default location
//   final String mapUrl =
//       'https://www.google.com/maps';
//
//   void _launchGoogleMaps() async {
//     if (await canLaunchUrl(mapUrl as Uri)) {
//       await launchUrl(mapUrl as Uri);
//     } else {
//       throw 'Could not launch $mapUrl';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Card(
//             margin: const EdgeInsets.all(10),
//             child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   "Parking Charges differ according to vehicle type.",
//                   style: TextStyle(color: c1),
//                 ),
//               ),
//
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Card(
//             margin: EdgeInsets.all(10),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Table(
//                 // border: TableBorder.all(),
//                 columnWidths: const {
//                   0: FlexColumnWidth(1.0),
//                   1: FlexColumnWidth(1.0),
//                 },
//                 children: const [
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Vehicle Type',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Parking Charge',
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Motorcycle'),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('RM 5.0'),
//                         ),
//                       ),
//                     ],
//                   ),
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Car'),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('RM 10.0'),
//                         ),
//                       ),
//                     ],
//                   ),
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Lorry'),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('RM 15.0'),
//                         ),
//                       ),
//                     ],
//                   ),
//                   TableRow(
//                     children: [
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('Van'),
//                         ),
//                       ),
//                       TableCell(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text('RM 12.0'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 35,
//           ),
//           Center(
//             child: Card(
//               elevation: 5,
//               child: InkWell(
//                 onTap: _launchGoogleMaps,
//                 child: Container(
//                   height: 200,
//                   width: double.infinity,
//                   child: GoogleMap(
//                     initialCameraPosition:
//                         CameraPosition(target: initialCameraPosition, zoom: 14),
//                     markers: {
//                       Marker(
//                           markerId: MarkerId('1'),
//                           position: initialCameraPosition),
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               // Navigate to the NearbyParkingPage
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => NearbyParking()));
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: c5),
//             child: Text('Look For Parking', style: TextStyle(color: c1),),
//           ),
//           const SizedBox(height: 6),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Number of Available Parking Spots: 50',
//                   // Replace with dynamic data
//                   style: TextStyle(fontSize: 18, color: c1),
//                 ),
//                 const SizedBox(height: 16),
//                 // Replace the following Container with your map implementation
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'NearbyParking.dart';
import 'package:smart_parking/themes/ColourThemes.dart';

class ParkingSpacePage extends StatefulWidget {
  @override
  _ParkingSpacePageState createState() => _ParkingSpacePageState();
}

class _ParkingSpacePageState extends State<ParkingSpacePage> {
  late GoogleMapController mapController;
  final LatLng initialCameraPosition = const LatLng(37.7749, -122.4194);
  final String mapUrl = 'https://www.google.com/maps';

  Future<void> _launchGoogleMaps() async {
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Parking Charges differ according to vehicle type.",
                style: TextStyle(color: c1),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                // border: TableBorder.all(),
                columnWidths: const {
                  0: FlexColumnWidth(1.0),
                  1: FlexColumnWidth(1.0),
                },
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Vehicle Type',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Parking Charge',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Motorcycle'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('RM 5.0'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Car'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('RM 10.0'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Lorry'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('RM 15.0'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Van'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('RM 12.0'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Text("Maps Navigation: ", style: TextStyle(fontSize: 18, color: c1, fontWeight: FontWeight.bold),),
          Center(
            child: Card(
              elevation: 5,
              child: InkWell(
                onTap: _launchGoogleMaps,
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: initialCameraPosition,
                      zoom: 14,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('1'),
                        position: initialCameraPosition,
                      ),
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NearbyParking()),
              );
            },
            // Replace with your color theme
            style: ElevatedButton.styleFrom(backgroundColor: c1),
            child: Text(
              'Look For Parking',
              style: TextStyle(color: c4),
            ),
          ),
          // const SizedBox(height: 6),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Number of Available Parking Spots: 50',
          //         // Replace with dynamic data
          //         style: TextStyle(fontSize: 18),
          //       ),
          //       SizedBox(height: 16),
          //       // Replace the following Container with your map implementation
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
