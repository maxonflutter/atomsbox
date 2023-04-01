import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.abrilFatface(),
      displayMedium: GoogleFonts.abrilFatface(),
      displaySmall: GoogleFonts.abrilFatface(),
      headlineLarge: GoogleFonts.abrilFatface(),
      headlineMedium: GoogleFonts.abrilFatface(),
      headlineSmall: GoogleFonts.abrilFatface(),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.abrilFatface(
        textStyle: ThemeData().textTheme.headlineLarge,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      // Primary color
      primary: MaterialColor(
        0xFF26337C,
        {
          400: Color(0xFF31AAFF), // Primary Light,
          500: Color(0xFF26337C), // Primary
          600: Color(0xFF00093C), // Primary Dark
        },
      ),
      onPrimary: Color(0xFFffffff),
      primaryContainer: Color(0xFFDEE0FF),
      onPrimaryContainer: Color(0xFF00093C),
      // Secondary color
      secondary: MaterialColor(
        0xFF9C254D,
        {
          400: Color(0xFFd34675), // Secondary Light
          500: Color(0xFF9C254D), // Secondary
          600: Color(0xFF3F0018), // Secondary Dark
        },
      ),
      onSecondary: Color(0xFFffffff),
      secondaryContainer: Color(0xFFFFD9DF),
      onSecondaryContainer: Color(0xFF3F0018),
      error: Color(0xFF9b4054),
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black87,
      surface: Color(0xFFeff0fa),
      onSurface: Colors.black87,
    ),
  );
}
