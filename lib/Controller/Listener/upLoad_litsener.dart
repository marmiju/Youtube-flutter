import 'package:you_tube/Controller/Services/VideoServies/Upload_video.dart';
import 'package:you_tube/Controller/Services/VideoServies/videoService.dart';

void uploadLitsener(
    title, desctiption, isPublic, thumbnail, video, fileName) async {
  print('Uploading video...');
  final videourl = await uploadVideo(video, fileName);
  print('video url : $videourl');

  Videoservice().setVideo(title, desctiption, isPublic, thumbnail, videourl);
  print('setting video...');
}
