import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Provider/CurrentUserProvider.dart';
import 'package:you_tube/View/Widget/LogoButton.dart';
import 'package:you_tube/View/Widget/title/h3.dart';
import 'package:you_tube/View/Widget/userCard/UserCard.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserDataProvider);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          user.when(
              data: (data) => Usercard(user: data!),
              error: (err, s) {
                print(FirebaseAuth.instance.currentUser!.displayName);
                print(err);
                return Text(err.toString());
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  )),
          SizedBox(
            height: 36,
          ),
          H3(title: "History"),
          Container(
            height: 150,
            width: 100,
            color: Colors.blue,
          ),
          H3(title: "Recent shorts"),
          Container(
            height: 150,
            width: 100,
            color: Colors.blue,
          ),
          H3(title: "History"),
          Container(
            height: 150,
            width: 100,
            color: Colors.blue,
          ),
          LogoButton(
              img: 'assets/images/leavenow.png',
              title: 'Leave Now',
              btnclick: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Are You Sure'),
                        content: Text('Log Out My Account'),
                        actions: [
                          TextButton(onPressed: () {}, child: Text('No')),
                          TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                ref.refresh(currentUserDataProvider);
                                Navigator.pop(context);
                              },
                              child: Text('Yes')),
                        ],
                      );
                    });
              })
        ],
      ),
    );
  }
}
