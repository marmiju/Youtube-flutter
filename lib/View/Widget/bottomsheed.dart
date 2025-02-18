import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:you_tube/Controller/Listener/video/PickVideo.dart';
import 'package:you_tube/View/Widget/Button/LogoButton.dart';

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
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 50),
            width: double.infinity,
            child: SingleChildScrollView(
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
      ),
    );
  }
}
