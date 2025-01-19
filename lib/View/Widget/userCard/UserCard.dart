import 'package:flutter/material.dart';
import 'package:you_tube/Model/UserModel.dart';
import 'package:you_tube/View/Widget/userCard/CircularImage.dart';
import 'package:you_tube/View/Widget/userCard/titlewithDesc.dart';

class Usercard extends StatelessWidget {
  const Usercard({
    super.key,
    required this.user,
  });

  final Usermodel user;

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
        Titlewithdesc(title: user.username, desc: user.email)
      ],
    );
  }
}
