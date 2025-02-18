import 'package:flutter/material.dart';
import 'package:you_tube/Controller/Services/VideoServies/fetchvideo.dart';
import 'package:you_tube/Model/VideoModel.dart';
import 'package:you_tube/View/Screen/error/errorpage.dart';
import 'package:you_tube/View/Widget/video/video_banner.dart';

class Videoscreen extends StatelessWidget {
  const Videoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<Videomodel>>(
        stream: Videos().fetchVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                height: 200,
                color: Colors.grey.shade100,
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No videos available'),
            );
          }
          if (snapshot.hasError) {
            return Errorpage();
          }
          final videos = snapshot.data!;
          return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              Videomodel video = videos[index];
              return VideoBanner(video: video);
            },
          );
        },
      ),
    );
  }
}
