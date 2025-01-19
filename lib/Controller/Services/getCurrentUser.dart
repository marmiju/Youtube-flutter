import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_tube/Model/UserModel.dart';

class GetCurrentUser {
  FirebaseAuth db = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<Usermodel?> getCurrentUserData() {
    try {
      // Listen to the Firestore document in real-time using snapshots
      return firebaseFirestore
          .collection('users')
          .doc(db.currentUser!.uid)
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          return Usermodel.fromJson(documentSnapshot.data()!);
        } else {
          print("No user data found in Firestore.");
          return null;
        }
      });
    } catch (e) {
      print("Error loading user data: $e");
      throw Exception('Error loading user data: $e');
    }
  }
}
