import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({
    super.key,
    required this.img,
    required this.title,
    required this.btnclick,
    this.horizentalalign,
    this.textcolor = Colors.black, // Default text color
  });

  final String img;
  final String title;
  final Function btnclick;
  final MainAxisAlignment? horizentalalign;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        btnclick();
      },
      child: Row(
        mainAxisAlignment: horizentalalign ?? MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            img,
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 10), // space between icon and text
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textcolor, // Use the passed textcolor
            ),
          ),
        ],
      ),
    );
  }
}
