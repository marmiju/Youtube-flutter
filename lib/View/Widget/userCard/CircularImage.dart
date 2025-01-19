import 'package:flutter/material.dart';

class Circularimage extends StatelessWidget {
  const Circularimage(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  final image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        image,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
