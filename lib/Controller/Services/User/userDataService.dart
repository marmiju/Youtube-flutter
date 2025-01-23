import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_tube/Model/UserModel.dart';

class UserDataService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUserDataToFirestore() async {
    try {
      Usermodel user = Usermodel(
        username: auth.currentUser!.displayName!,
        email: auth.currentUser!.email!,
        profilePic: auth.currentUser!.photoURL!,
        subscriptions: [],
        videos: [],
        userId: auth.currentUser!.uid,
        description: "",
        type: 'channel',
      );

      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set(user.toMap());
      print("User data added to Firestore successfully!");
    } catch (e) {
      print("Error adding user data to Firestore: $e");
    }
  }
}
