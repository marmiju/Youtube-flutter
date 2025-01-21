import 'dart:io';

import 'package:image_picker/image_picker.dart';

pickvideo() async {
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  File video = File(file!.path);
  if (video != null) {
    return video;
  }
}
