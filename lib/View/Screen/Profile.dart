import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/Controller/Listener/LogOut.dart';
import 'package:you_tube/Controller/Provider/Users/CurrentUserProvider.dart';
import 'package:you_tube/View/Widget/Button/LogoButton.dart';
import 'package:you_tube/View/Widget/title/h3.dart';
import 'package:you_tube/View/Widget/userCard/UserCard.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserDataProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            user.when(
                data: (data) => Usercard(user: data!),
                error: (err, s) {
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
            LogoButton(
              img: 'assets/images/downloads.png',
              title: 'Downloads',
              btnclick: () {},
            ),
            LogoButton(
              img: 'assets/images/leavenow.png',
              title: 'Leave Now',
              btnclick: () {
                logOut(context);
              },
              horizentalalign: MainAxisAlignment.start,
            ),
          ],
        ),
      ),
    );
  }
}
