import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final simpleTextThemeLight = GoogleFonts.poppinsTextTheme().copyWith(
  displayLarge: GoogleFonts.abrilFatface(),
  displayMedium: GoogleFonts.abrilFatface(),
  displaySmall: GoogleFonts.abrilFatface(),
  headlineLarge: GoogleFonts.abrilFatface(color: Colors.black87),
  headlineMedium: GoogleFonts.abrilFatface(color: Colors.black87),
  headlineSmall: GoogleFonts.abrilFatface(color: Colors.black87),
);

final simpleTextThemeDark = GoogleFonts.poppinsTextTheme(
  ThemeData(brightness: Brightness.dark).textTheme,
).copyWith(
  displayLarge: GoogleFonts.abrilFatface(),
  displayMedium: GoogleFonts.abrilFatface(),
  displaySmall: GoogleFonts.abrilFatface(),
  headlineLarge: GoogleFonts.abrilFatface(),
  headlineMedium: GoogleFonts.abrilFatface(),
  headlineSmall: GoogleFonts.abrilFatface(),
);
