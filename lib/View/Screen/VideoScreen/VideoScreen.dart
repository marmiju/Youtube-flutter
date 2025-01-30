import 'package:flutter/material.dart';
import 'package:you_tube/Controller/Services/VideoServies/fetchvideo.dart';
import 'package:you_tube/Model/VideoModel.dart';

class Videoscreen extends StatelessWidget {
  const Videoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<List<Videomodel>>(
          stream: Videos().fetchVideos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('empty data'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              Center(
                child: LinearProgressIndicator(),
              );
            }

            return Center(
              child: Text(snapshot.data![1].title ?? 'No video found'),
            );
          }),
    );
  }
}
