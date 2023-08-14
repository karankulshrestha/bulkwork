import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
          displaySmall: GoogleFonts.montserrat(color: Colors.black12),
          displayMedium: GoogleFonts.montserrat(color: Colors.black12),
          displayLarge: GoogleFonts.montserrat(color: Colors.black12)));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
          displaySmall: GoogleFonts.montserrat(color: Colors.white),
          displayMedium: GoogleFonts.montserrat(color: Colors.white),
          displayLarge: GoogleFonts.montserrat(color: Colors.white)));
}
