import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future pickImage() async {
  final file = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (file == null) return;
  final imagepath = File(file.path);
  return imagepath;
}
