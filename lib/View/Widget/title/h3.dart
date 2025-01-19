import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class H3 extends StatelessWidget {
  const H3({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
