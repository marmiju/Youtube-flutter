import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_tube/Model/UserModel.dart';

class GetCurrentUser {
  FirebaseAuth db = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<Usermodel?> getCurrentUserData() async {
    try {
      // Fetch the document for the current user
      final currentUserDoc = await firebaseFirestore
          .collection('users')
          .doc(db.currentUser!.uid)
          .get();

      // Check if the document exists
      if (currentUserDoc.exists) {
        // Convert the Firestore document to a Usermodel instance
        return Usermodel.fromJson(currentUserDoc.data()!);
      } else {
        print("No user data found in Firestore.");
        return null;
      }
    } catch (e) {
      print("Error loading user data: $e");
      throw Exception('Error loading user data: $e');
    }
  }
}
