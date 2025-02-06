import 'package:you_tube/Controller/Provider/Videos/UploadStatus.dart';
import 'package:you_tube/Controller/Services/VideoServies/Upload/ImageUpload.dart';
import 'package:you_tube/Controller/Services/VideoServies/Upload/Upload_video.dart';
import 'package:you_tube/Controller/Services/VideoServies/Upload/videoService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

uploadLitsener(
  title,
  description,
  isPublic,
  thumbnail,
  video,
  fileName,
  context,
  WidgetRef ref,
) async {
  final uploadStatusNotifier = ref.read(uploadStatusProvider.notifier);

  try {
    // Set status to uploading
    uploadStatusNotifier.setStatus('uploading');

    print('Uploading video...'); // Debug print

    final videoUrl = await uploadVideo(video, fileName, context);
    print('Video URL: $videoUrl'); // Debug print

    //===============
    final _thumbnail = await uploadImage(thumbnail);

    await Videoservice().setVideo(
        title, description, isPublic, _thumbnail, videoUrl, ref, context);

    uploadStatusNotifier.setStatus('success');
  } catch (e) {
    print('Error: $e'); // Debug error

    uploadStatusNotifier.setStatus('error');
  }
}
