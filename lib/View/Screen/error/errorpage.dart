import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Errorpage extends StatelessWidget {
  const Errorpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/error.json'),
          SizedBox(height: 30),
          Text(
            'Opps!',
            style: GoogleFonts.poppins(
                color: Colors.red.shade500,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Something went wrong!',
            style: GoogleFonts.roboto(
              color: Colors.blueGrey,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
