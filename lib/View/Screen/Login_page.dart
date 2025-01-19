import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Provider/authProvider.dart';
import 'package:you_tube/View/Widget/LogoButton.dart';

class LogInPage extends ConsumerWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final size =  MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text('You tube')),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log In',
              style: TextStyle(
                  fontSize: height * 0.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            Text(
              'Log In to continue',
              style: TextStyle(
                  fontSize: height * 0.03, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: height * 0.09,
            ),
            LogoButton(
              img: 'assets/images/google.png',
              title: 'log in with Google',
              btnclick: () async {
                final user = await ref.read(AuthProvider).SigninWithGoogle();
                print(user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
