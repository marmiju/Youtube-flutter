import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  const LogoButton({
    super.key,
    required this.img,
    required this.title,
    required this.btnclick,
  });

  final String img;
  final String title;
  final Function btnclick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          print("Button clicked!"); // Debug print
          btnclick(); // Ensure this function is invoked
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: Colors.white),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                spreadRadius: 2,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                img,
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 10), // Add spacing between icon and text
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
