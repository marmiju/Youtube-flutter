import 'package:flutter/material.dart';
import 'package:you_tube/Model/VideoModel.dart';
import 'package:you_tube/View/Widget/userCard/titlewithDesc.dart';

class VideoBanner extends StatelessWidget {
  const VideoBanner({super.key, required this.video});

  final Videomodel video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.network(
                  video.thumbnail,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0, // Align at the bottom
                  left: 0, // Align to the left
                  right: 0, // Stretch to full width
                  child: LinearProgressIndicator(
                    color: Colors.red,
                    value: 0.6,
                    minHeight: 5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Titlewithdesc(
            title: video.title,
            desc: video.description,
            titlesize: 18,
            descsize: 14,
          ),
          Text(video.views >= 1000
              ? '${(video.views / 1000).toStringAsFixed(0)}K Viwes'
              : '${video.views} Views')
        ],
      ),
    );
  }
}
