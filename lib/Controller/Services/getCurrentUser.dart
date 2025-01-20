import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_tube/Model/UserModel.dart';

class GetCurrentUser {
  FirebaseAuth db = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<Usermodel?> getCurrentUserData() {
    final user = db.currentUser;
    if (user == null) {
      print("No user is currently logged in.${user!.displayName}");
      return Stream.error('User is not logged in');
    }
    try {
      print(user.email);
      return firebaseFirestore
          .collection('users')
          .doc(db.currentUser!.uid)
          .snapshots()
          .map((documentSnapshot) {
        if (documentSnapshot.exists) {
          print(" Get User ${documentSnapshot.data()}");
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
