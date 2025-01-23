import 'package:you_tube/Controller/Services/Upload_video.dart';
import 'package:you_tube/Controller/Services/videoService.dart';

void uploadLitsener(
    title, desctiption, isPublic, thumbnail, video, fileName) async {
  print('Uploading video...');
  final videourl = await uploadVideo(video, fileName);
  print('video url : $videourl');

  Videoservice().setVideo(title, desctiption, isPublic, thumbnail, videourl);
  print('setting video...');
}
