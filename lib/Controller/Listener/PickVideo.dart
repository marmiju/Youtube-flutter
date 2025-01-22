import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:you_tube/View/Screen/uploadingdemo.dart';

Future<void> pickvideo(context) async {
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);

  if (file == null) {
    print("No video selected.");
    return;
  }

  File video = File(file.path);
  String fileName = '${DateTime.now().toIso8601String()}.mp4';

  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Uploadingdemo(
      fileName: fileName,
      video: video,
    );
  }));
}
