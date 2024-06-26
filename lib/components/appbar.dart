import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {

  final String title;

  const MyAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: Text(title, style: GoogleFonts.kranky(fontSize: 32))),
      );
  }
}
 