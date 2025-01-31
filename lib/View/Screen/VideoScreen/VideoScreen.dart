import 'package:flutter/material.dart';
import 'package:you_tube/Controller/Services/VideoServies/fetchvideo.dart';
import 'package:you_tube/Model/VideoModel.dart';

class Videoscreen extends StatelessWidget {
  const Videoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Videomodel>>(
        stream: Videos().fetchVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              // Wrap the CircularProgressIndicator in a Center widget
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              // Wrap the Text in a Center widget
              child: Text('No videos available'),
            );
          }
          if (snapshot.hasError) {
            return Center(
              // Wrap the Text in a Center widget
              child: Text('error'),
            );
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
                onTap: () {
                  print("Video URL: ${video.url}");
                },
              );
            },
          );
        },
      ),
    );
  }
}
