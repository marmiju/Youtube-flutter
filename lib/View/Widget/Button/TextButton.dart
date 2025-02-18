import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textButton extends StatelessWidget {
  const textButton({super.key, required this.text, required this.ontap});

  final String text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
