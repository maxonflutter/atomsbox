import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ColorPalette {
  transparent,
  primary,
  secondary,
  tertiary,
  primaryContainer,
  secondaryContainer,
  tertiaryContainer,
  surface,
}

/// Returns a [ThemeData] object with custom settings for the atomsbox's simple
/// design system.
///
/// The simpleAppTheme function creates a [ThemeData] object that uses Material 3
/// and customizes text styles, color schemes, and the app bar theme. The text
/// styles are based on Google Fonts Poppins and Abril Fatface.
///
/// See also:
/// * [ThemeData], which defines the configuration of the overall visual theme
/// for a MaterialApp or a widget subtree within the app.
/// * [ColorScheme], which defines the set of colors used in the theme.
/// * [GoogleFonts], which provides access to the Google Fonts library.
///
ThemeData simpleAppTheme() {
  return ThemeData(
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
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      // Primary color
      primary: const MaterialColor(
        0xFF2977FF,
        {
          400: Color(0xFF31AAFF), // Primary Light,
          500: Color(0xFF26337C), // Primary
          600: Color(0xFF00093C), // Primary Dark
        },
      ),
      onPrimary: const Color(0xFFffffff),
      primaryContainer: const Color(0xFFDEE0FF),
      onPrimaryContainer: const Color(0xFF00093C),

      // Secondary color
      secondary: const MaterialColor(
        0xFFFFB129,
        {
          400: Color(0xFFd34675), // Secondary Light
          500: Color(0xFF9C254D), // Secondary
          600: Color(0xFF3F0018), // Secondary Dark
        },
      ),
      onSecondary: const Color(0xFFffffff),
      secondaryContainer: const Color(0xFFFFD9DF),
      onSecondaryContainer: const Color(0xFF3F0018),
      error: errorSwatch,
      onError: errorSwatch[100]!,
      background: Colors.white,
      onBackground: Colors.black87,
      surface: neutralVariantSwatch[95]!,
      onSurface: Colors.black87,
      // primary: const MaterialColor(
      //   0xFF2977FF,
      //   {
      //     400: Color(0xFF31AAFF), // Primary Light,
      //     500: Color(0xFF2977FF), // Primary
      //     600: Color(0xFF000f5d), // Primary Dark
      //   },
      // ),
      // primaryContainer: const Color(0xFFe3f3ff),
      // onPrimaryContainer: const Color(0xFF000f5d),
      // secondary: const MaterialColor(
      //   0xFFFFB129,
      //   {
      //     400: Color(0xFFFFC932), // Secondary Light
      //     500: Color(0xFFFFB129), // Secondary
      //     600: Color(0xFFE36F03), // Secondary Dark
      //   },
      // ),
      // onSecondary: const Color(0xFFffffff),
      // secondaryContainer: const Color(0xFFe3f3ff),
      // onSecondaryContainer: const Color(0xFFE36F03),
    ),
    // ColorScheme(
    //   brightness: Brightness.light,
    //   primary: primarySwatch,
    //   onPrimary: primarySwatch[100]!,
    //   primaryContainer: primarySwatch[90]!,
    //   onPrimaryContainer: primarySwatch[10]!,
    //   secondary: secondarySwatch,
    //   onSecondary: secondarySwatch[100]!,
    //   secondaryContainer: secondarySwatch[90]!,
    //   onSecondaryContainer: secondarySwatch[10]!,
    //   tertiary: tertiarySwatch,
    //   onTertiary: tertiarySwatch[100]!,
    //   tertiaryContainer: tertiarySwatch[90]!,
    //   onTertiaryContainer: tertiarySwatch[10]!,
    //   error: errorSwatch,
    //   onError: errorSwatch[100]!,
    //   background: neutralSwatch[99]!,
    //   onBackground: neutralSwatch[10]!,
    //   surface: neutralVariantSwatch[95]!,
    //   onSurface: neutralVariantSwatch[30]!,
    //   surfaceVariant: neutralSwatch[90]!,
    //   onSurfaceVariant: neutralSwatch[30]!,
    //   outline: neutralVariantSwatch[50]!,
    // ),
  );
}

Map<String, Color?> getColorPalette(ColorPalette colorPalette) {
  final colorScheme = simpleAppTheme().colorScheme;
  var colorPalettes = {
    ColorPalette.primary: {
      'background': colorScheme.primary,
      'foreground': colorScheme.onPrimary,
      'highlight': colorScheme.onPrimary.withOpacity(0.2),
      'disabledBackground': colorScheme.surface,
      'disabledForeground': colorScheme.onSurface,
    },
    ColorPalette.primaryContainer: {
      'background': colorScheme.primaryContainer,
      'foreground': colorScheme.onPrimaryContainer,
      'highlight': colorScheme.onPrimaryContainer.withOpacity(0.2),
      'disabledBackground': colorScheme.surfaceVariant,
      'disabledForeground': colorScheme.onSurfaceVariant,
    },
    ColorPalette.secondary: {
      'background': colorScheme.secondary,
      'foreground': colorScheme.onSecondary,
      'highlight': colorScheme.onSecondary.withOpacity(0.2),
      'disabledBackground': colorScheme.surface,
      'disabledForeground': colorScheme.onSurface,
    },
    ColorPalette.secondaryContainer: {
      'background': colorScheme.secondaryContainer,
      'foreground': colorScheme.onSecondaryContainer,
      'highlight': colorScheme.onSecondaryContainer.withOpacity(0.2),
      'disabledBackground': colorScheme.surfaceVariant,
      'disabledForeground': colorScheme.onSurfaceVariant,
    },
    ColorPalette.surface: {
      'background': colorScheme.surface,
      'foreground': colorScheme.onSurface,
      'highlight': colorScheme.onSurface.withOpacity(0.2),
      'disabledBackground': colorScheme.surfaceVariant,
      'disabledForeground': colorScheme.onSurfaceVariant,
    },
    ColorPalette.transparent: {
      'background': Colors.transparent,
      'foreground': colorScheme.primary,
      'highlight': Colors.transparent,
      'disabledBackground': Colors.transparent,
      'disabledForeground': Colors.transparent,
    }
  };

  return colorPalettes[colorPalette] ??
      {
        'background': colorScheme.primary,
        'foreground': colorScheme.onPrimary,
        'highlight': colorScheme.onPrimary.withOpacity(0.2),
        'disabledBackground': colorScheme.surface,
        'disabledForeground': colorScheme.onSurface,
      };
}

/// A [MaterialColor] object representing the primary color swatch.
///
/// primarySwatch is a [MaterialColor] constructed using the primary color
/// with the hex value 0xFF192256. It uses the primaryColor map to define
/// its shades.
final primarySwatch = MaterialColor(0xFF192256, primaryColor);

/// A [MaterialColor] object representing the secondary color swatch.
///
/// secondarySwatch is a [MaterialColor] constructed using the secondary color
/// with the hex value 0xFF9C254D. It uses the secondaryColor map to define
/// its shades.
final secondarySwatch = MaterialColor(0xFF9C254D, secondaryColor);

/// A [MaterialColor] object representing the tertiary color swatch.
///
/// tertiarySwatch is a [MaterialColor] constructed using the tertiary color
/// with the hex value 0xFFB3CFD0. It uses the tertiaryColor map to define
/// its shades.
final tertiarySwatch = MaterialColor(0xFFB3CFD0, tertiaryColor);

/// A [MaterialColor] object representing the error color swatch.
///
/// errorSwatch is a [MaterialColor] constructed using the error color
/// with the hex value 0xFF9b4054. It uses the errorColor map to define
/// its shades.
final errorSwatch = MaterialColor(0xFF9b4054, errorColor);

/// A [MaterialColor] object representing the neutral color swatch.
///
/// neutralSwatch is a [MaterialColor] constructed using the neutral color
/// with the hex value 0xFFf7f8fd. It uses the neutralColor map to define
/// its shades.
final neutralSwatch = MaterialColor(0xFFf7f8fd, neutralColor);

/// A [MaterialColor] object representing the neutral variant color swatch.
///
/// neutralVariantSwatch is a [MaterialColor] constructed using the neutral variant color
/// with the hex value 0xFFe6e9f8. It uses the neutralVariantColor map to define
/// its shades.
final neutralVariantSwatch = MaterialColor(0xFFe6e9f8, neutralVariantColor);

Map<int, Color> primaryColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF000841),
  10: const Color(0xFF000f5d),
  20: const Color(0xFF182778),
  25: const Color(0xFF253384),
  30: const Color(0xFF313f90),
  35: const Color(0xFF3e4b9c),
  40: const Color(0xFF4a58a9),
  50: const Color(0xFF6371c4),
  60: const Color(0xFF7d8be0),
  70: const Color(0xFF98a5fd),
  80: const Color(0xFFbbc3ff),
  90: const Color(0xFFdee0ff),
  95: const Color(0xFFf0efff),
  98: const Color(0xFFfbf8ff),
  99: const Color(0xFFfffbff),
  100: const Color(0xFFffffff),
};

Map<int, Color> secondaryColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF2b000e),
  10: const Color(0xFF3f0018),
  20: const Color(0xFF66002a),
  25: const Color(0xFF790335),
  30: const Color(0xFF891540),
  35: const Color(0xFF99234b),
  40: const Color(0xFFa93057),
  50: const Color(0xFFca496f),
  60: const Color(0xFFeb6288),
  70: const Color(0xFFff85a4),
  80: const Color(0xFFffb1c1),
  90: const Color(0xFFffd9df),
  95: const Color(0xFFffecee),
  98: const Color(0xFFfff8f7),
  99: const Color(0xFFfffbff),
  100: const Color(0xFFffffff)
};

Map<int, Color> tertiaryColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF001415),
  10: const Color(0xFF002021),
  20: const Color(0xFF003739),
  25: const Color(0xFF004345),
  30: const Color(0xFF004f52),
  35: const Color(0xFF005c5f),
  40: const Color(0xFF00696d),
  50: const Color(0xFF008489),
  60: const Color(0xFF00a1a6),
  70: const Color(0xFF1dbdc3),
  80: const Color(0xFF4cd9df),
  90: const Color(0xFF6ff6fc),
  95: const Color(0xFFbcfcff),
  98: const Color(0xFFe5feff),
  99: const Color(0xFFf1ffff),
  100: const Color(0xFFffffff)
};
Map<int, Color> neutralColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF0f1114),
  10: const Color(0xFF1a1c1e),
  20: const Color(0xFF2f3033),
  25: const Color(0xFF3a3b3e),
  30: const Color(0xFF45474a),
  35: const Color(0xFF515255),
  40: const Color(0xFF5d5e61),
  50: const Color(0xFF76777a),
  60: const Color(0xFF909094),
  70: const Color(0xFFaaabae),
  80: const Color(0xFFc6c6c9),
  90: const Color(0xFFe2e2e5),
  95: const Color(0xFFf1f0f4),
  98: const Color(0xFFf9f9fc),
  99: const Color(0xFFfcfcff),
  100: const Color(0xFFffffff)
};
Map<int, Color> neutralVariantColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF0e1118),
  10: const Color(0xFF191b23),
  20: const Color(0xFF2e3038),
  25: const Color(0xFF393b43),
  30: const Color(0xFF44474f),
  35: const Color(0xFF50525a),
  40: const Color(0xFF5c5e67),
  50: const Color(0xFF757780),
  60: const Color(0xFF8e9099),
  70: const Color(0xFFa9abb4),
  80: const Color(0xFFc5c6d0),
  90: const Color(0xFFe1e2ec),
  95: const Color(0xFFeff0fa),
  98: const Color(0xFFfaf9ff),
  99: const Color(0xFFfefbff),
  100: const Color(0xFFffffff)
};

Map<int, Color> errorColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF2d0001),
  10: const Color(0xFF410003),
  20: const Color(0xFF5f1413),
  25: const Color(0xFF6e1f1c),
  30: const Color(0xFF7e2b26),
  35: const Color(0xFF8d3631),
  40: const Color(0xFF9c413c),
  50: const Color(0xFFbc5952),
  60: const Color(0xFFdb7269),
  70: const Color(0xFFfb8b82),
  80: const Color(0xFFffb3ac),
  90: const Color(0xFFffdad6),
  95: const Color(0xFFffedeb),
  98: const Color(0xFFfff8f7),
  99: const Color(0xFFfffbff),
  100: const Color(0xFFffffff)
};
