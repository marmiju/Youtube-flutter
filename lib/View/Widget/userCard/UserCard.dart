import 'package:flutter/material.dart';
import 'package:you_tube/View/Widget/userCard/CircularImage.dart';
import 'package:you_tube/View/Widget/userCard/titlewithDesc.dart';

class Usercard extends StatelessWidget {
  const Usercard({
    super.key,
    this.user,
  });

  final user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Circularimage(
          image: user.profilePic,
          height: 70,
          width: 70,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Titlewithdesc(
            title: user.username,
            desc: user.email,
            titlesize: 24,
            descsize: 16,
          ),
        ),
      ],
    );
  }
}
