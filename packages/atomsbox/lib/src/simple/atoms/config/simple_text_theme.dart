import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final simpleTextThemeLight = GoogleFonts.poppinsTextTheme(
  ThemeData(brightness: Brightness.light).textTheme,
).copyWith(
  displayLarge: GoogleFonts.abrilFatfaceTextTheme().displayLarge,
  displayMedium: GoogleFonts.abrilFatfaceTextTheme().displayMedium,
  displaySmall: GoogleFonts.abrilFatfaceTextTheme().displaySmall,
  headlineLarge: GoogleFonts.abrilFatfaceTextTheme().headlineLarge,
  headlineMedium: GoogleFonts.abrilFatfaceTextTheme().headlineMedium,
  headlineSmall: GoogleFonts.abrilFatfaceTextTheme().headlineSmall,
);

final simpleTextThemeDark = GoogleFonts.poppinsTextTheme(
  ThemeData(brightness: Brightness.dark).textTheme,
).copyWith(
  displayLarge: GoogleFonts.abrilFatfaceTextTheme()
      .displayLarge!
      .copyWith(color: Colors.white),
  displayMedium: GoogleFonts.abrilFatfaceTextTheme()
      .displayMedium!
      .copyWith(color: Colors.white),
  displaySmall: GoogleFonts.abrilFatfaceTextTheme()
      .displaySmall!
      .copyWith(color: Colors.white),
  headlineLarge: GoogleFonts.abrilFatfaceTextTheme()
      .headlineLarge!
      .copyWith(color: Colors.white),
  headlineMedium: GoogleFonts.abrilFatfaceTextTheme()
      .headlineMedium!
      .copyWith(color: Colors.white),
  headlineSmall: GoogleFonts.abrilFatfaceTextTheme()
      .headlineSmall!
      .copyWith(color: Colors.white),
);
