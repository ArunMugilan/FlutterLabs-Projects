
import 'package:flutter/material.dart';
import 'package:smart_parking/models/users.dart';
import 'AddParking.dart';
import 'ParkingSpace.dart';
import 'History.dart';
import 'Profile.dart';
import 'package:smart_parking/themes/ColourThemes.dart';

class Dashboard extends StatefulWidget {
  final User user;

  const Dashboard({super.key, required this.user});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  void initPages() {
    _pages = [
      ParkingSpacePage(),
      widget.user.usertype == 'admin' ? AddParkingPage() : HistoryPage(),
      HistoryPage(),
      ProfilePage(
        user: widget.user,
      ),
    ];
  }

  @override
  void initState() {
    initPages();

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c4,
      appBar: AppBar(
        title: Text(
          'Smart Parking Dashboard',
          style: TextStyle(color: c1),
        ),
        backgroundColor: c5,
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: c5,
        unselectedItemColor: c3,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: 'Parking Space',
          ),
          // BottomNavigationBarItem(
          //    icon: Icon(Icons.add), // Icon for admin to add parking
          //    label: 'Add Parking',
          //  ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// lib/screens/dashboard.dart
// import 'package:flutter/material.dart';
// import 'package:smart_parking/models/users.dart';
// import 'ParkingSpace.dart';
// import 'History.dart';
// import 'Profile.dart';
// import 'AddParking.dart'; // Import the new AddParking.dart file
// import 'package:smart_parking/themes/ColourThemes.dart';
//
// class Dashboard extends StatefulWidget {
//   final User user;
//
//   const Dashboard({super.key, required this.user});
//
//   @override
//   _DashboardState createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   int _selectedIndex = 0;
//   late List<Widget> _pages;
//
//   void initPages() {
//     // Updated _pages list to include AddParkingPage for admin
//     _pages = [
//       ParkingSpacePage(),
//       widget.user.usertype == 'admin' ? AddParkingPage() : HistoryPage(),
//       ProfilePage(
//         user: widget.user,
//       ),
//     ];
//   }
//
//   @override
//   void initState() {
//     initPages();
//
//     super.initState();
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: c4,
//       appBar: AppBar(
//         title: Text(
//           'Smart Parking Dashboard',
//           style: TextStyle(color: c1),
//         ),
//         backgroundColor: c5,
//         centerTitle: true,
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: c5,
//         unselectedItemColor: c3,
//         selectedItemColor: Colors.black,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_parking),
//             label: 'Parking Space',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add), // Icon for admin to add parking
//             label: 'Add Parking',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
