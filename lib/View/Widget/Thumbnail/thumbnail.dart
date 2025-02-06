import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:you_tube/Controller/Listener/Thumbnail/pickImage.dart';

class Thumbnail extends StatefulWidget {
  const Thumbnail({super.key, required this.onpickimage});
  final void Function(File image) onpickimage;

  @override
  _ThumbnailState createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  File? _thumbnail;

  Future<void> _pickImage() async {
    final image = await pickImage();
    if (image != null) {
      setState(() {
        _thumbnail = image;
      });
      widget.onpickimage(_thumbnail!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.hardEdge,
          child: _thumbnail == null
              ? Image.asset(
                  'assets/images/thumbnail.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  _thumbnail!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Center(
              child: IconButton(
                onPressed: _pickImage,
                icon: Icon(
                  Icons.upload,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
