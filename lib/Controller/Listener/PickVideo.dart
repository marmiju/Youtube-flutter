import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:you_tube/Controller/Services/Upload_video.dart';

Future<void> pickAndUploadVideo() async {
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);

  if (file == null) {
    print("No video selected.");
    return;
  }

  // Convert the picked video into a File
  File video = File(file.path);
  String fileName = '${DateTime.now().toIso8601String()}.mp4';

  uploadShorts(video, fileName);
}
