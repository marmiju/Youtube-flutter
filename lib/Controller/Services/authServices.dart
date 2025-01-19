import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:you_tube/Controller/Services/userDataService.dart';

class AuthService {
  Future<UserCredential?> SigninWithGoogle() async {
    print("signIn mathod called");
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final authentication =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await UserDataService().addUserDataToFirestore();

      return authentication;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }
}
