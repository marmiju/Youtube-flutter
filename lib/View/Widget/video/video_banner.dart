import 'package:flutter/material.dart';
import 'package:you_tube/Model/VideoModel.dart';
import 'package:you_tube/View/Widget/userCard/titlewithDesc.dart';

class VideoBanner extends StatelessWidget {
  const VideoBanner({super.key, required this.video});

  final Videomodel video;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              video.thumbnail,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Titlewithdesc(title: video.title, desc: video.description)
      ],
    );
  }
}
