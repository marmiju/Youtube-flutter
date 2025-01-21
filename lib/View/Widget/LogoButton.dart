import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({
    super.key,
    required this.img,
    required this.title,
    required this.btnclick,
    this.horizentalalign,
    this.fontweight,
  });

  final String img;
  final String title;
  final Function btnclick;
  final horizentalalign;
  final fontweight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        btnclick();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: horizentalalign ?? MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              img,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 10), // space beetwin icon and text
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
