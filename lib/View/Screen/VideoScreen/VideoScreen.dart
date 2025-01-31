import 'package:flutter/material.dart';
import 'package:you_tube/Controller/Services/VideoServies/fetchvideo.dart';
import 'package:you_tube/Model/VideoModel.dart';
import 'package:you_tube/View/Screen/error/errorpage.dart';

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
              child: CircularProgressIndicator(),
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
              final video = videos[index];
              return ListTile(
                title:
                    Text(video.title.isEmpty ? "Untitled Video" : video.title),
                subtitle: Text(video.username),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
