import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:you_tube/Controller/Services/User/userDataService.dart';

class AuthService {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();

      // 1️⃣ Ensure Sign-Out Completely
      try {
        await googleSignIn
            .disconnect(); // Completely disconnect the cached account
      } catch (e) {
        print("Error disconnecting GoogleSignIn: $e");
      }

      await googleSignIn.signOut(); // Extra step to sign out
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase

      // 2️⃣ Now Start a Fresh Sign-In Process
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User cancelled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authentication =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // 3️⃣ Store User Data
      await UserDataService().addUserDataToFirestore();

      return authentication;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }
}
