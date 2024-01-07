// ParkingSpot model class (models/parking_spot.dart)
class ParkingSpot {
  final String id;
  final String address;
  final int numberOfParkingLots;
  final String imageUrl;

  ParkingSpot({
    required this.id,
    required this.address,
    required this.numberOfParkingLots,
    required this.imageUrl,
  });
}

// admin_dashboard.dart
// When admin adds a new parking spot, store the information in the database

// nearby_parking.dart
// Fetch parking spots from the database and display them

// parking_details.dart
// Show detailed information about a selected parking spot
// Include an option to book the parking spot

// book_parking.dart
// Implement the logic for booking a parking spot
// Update the database to reflect the booking status
