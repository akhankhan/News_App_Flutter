import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffee1b24),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/news.png', fit: BoxFit.cover),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'News Hub',
                style: GoogleFonts.montserrat(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/progressbar3.gif', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
