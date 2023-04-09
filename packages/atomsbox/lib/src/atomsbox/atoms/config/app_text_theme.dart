import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTextThemeLight = GoogleFonts.poppinsTextTheme(
  ThemeData(brightness: Brightness.light).textTheme,
).copyWith(
  displayLarge: GoogleFonts.abrilFatfaceTextTheme().displayLarge,
  displayMedium: GoogleFonts.abrilFatfaceTextTheme().displayMedium,
  displaySmall: GoogleFonts.abrilFatfaceTextTheme().displaySmall,
  headlineLarge: GoogleFonts.abrilFatfaceTextTheme().headlineLarge,
  headlineMedium: GoogleFonts.abrilFatfaceTextTheme().headlineMedium,
  headlineSmall: GoogleFonts.abrilFatfaceTextTheme().headlineSmall,
);

final appTextThemeDark = GoogleFonts.poppinsTextTheme(
  ThemeData(brightness: Brightness.dark).textTheme,
).copyWith(
  displayLarge: GoogleFonts.abrilFatfaceTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ).displayLarge,
  displayMedium: GoogleFonts.abrilFatfaceTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ).displayMedium,
  displaySmall: GoogleFonts.abrilFatfaceTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ).displaySmall,
  headlineLarge: GoogleFonts.abrilFatfaceTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ).headlineLarge,
  headlineMedium: GoogleFonts.abrilFatfaceTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ).headlineMedium,
  headlineSmall: GoogleFonts.abrilFatfaceTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ).headlineSmall,
);
