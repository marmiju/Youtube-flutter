import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class H3 extends StatelessWidget {
  const H3({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }
}
