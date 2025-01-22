import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hight,
    this.title,
  });

  final TextEditingController controller;
  final String hintText;
  final double hight;
  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16, left: 14, right: 14, bottom: 14),
          height: hight,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: TextField(
              maxLines: 2,
              cursorColor: Colors.black,
              style: TextStyle(
                color: Colors.black,
                overflow: TextOverflow.visible,
                fontSize: 16,
              ),
              controller: controller,
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
