import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:you_tube/View/Widget/LogoButton.dart';

class Custombottomsheet extends StatelessWidget {
  const Custombottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white54, width: 1),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 100,
            sigmaY: 100,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 70),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 22,
              children: [
                LogoButton(
                    img: 'assets/images/upvideo.png',
                    title: "Upload video",
                    btnclick: () {}),
                LogoButton(
                    img: 'assets/images/white_shorts.png',
                    title: "Create Shorts",
                    btnclick: () {}),
                LogoButton(
                    img: 'assets/images/white_live.png',
                    title: "Go live",
                    btnclick: () {}),
                LogoButton(
                    img: 'assets/images/white_post.png',
                    title: "Create Post",
                    btnclick: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
