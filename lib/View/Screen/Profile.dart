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
          SizedBox(height: 20),
          Container(
            height: 130,
            width: 200,
            color: Colors.black,
          ),
          SizedBox(height: 20),
          LogoButton(
            img: 'assets/images/videos.png',
            title: 'Your Videos',
            btnclick: () {},
          ),
          SizedBox(height: 15),
          LogoButton(
            img: 'assets/images/downloads.png',
            title: 'Downloads',
            btnclick: () {},
          ),
          SizedBox(height: 30),
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
            },
            horizentalalign: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
