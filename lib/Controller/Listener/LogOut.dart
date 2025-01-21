import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void logOut(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Are You Sure'),
          content: Text('Log Out My Account'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No')),
            TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                child: Text('Yes')),
          ],
        );
      });
}
