import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<bool> loginUser(String username, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: '$username@domain.com', // Firebase requires an email for authentication
        password: password,
      );

      return authResult.user != null; // Login successful if user is not null
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }
}
