import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:you_tube/Controller/Listener/PickVideo.dart';
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
            sigmaX: 50,
            sigmaY: 50,
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
                  btnclick: () {
                    pickvideo(context);
                  },
                  textcolor: Colors.white,
                ),
                LogoButton(
                  img: 'assets/images/white_shorts.png',
                  title: "Create Shorts",
                  btnclick: () {},
                  textcolor: Colors.white,
                ),
                LogoButton(
                  img: 'assets/images/white_live.png',
                  title: "Go live now",
                  btnclick: () {},
                  textcolor: Colors.white,
                ),
                LogoButton(
                  img: 'assets/images/white_post.png',
                  title: "Create Post",
                  btnclick: () {},
                  textcolor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
