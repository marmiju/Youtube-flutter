import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:you_tube/Controller/Services/userDataService.dart';

class AuthService {
  Future<UserCredential?> SigninWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();

      if (await googleSignIn.isSignedIn()) {
        await googleSignIn
            .signOut(); // Force sign-out to allow account selection
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
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

      await UserDataService().addUserDataToFirestore();

      return authentication;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }
}
