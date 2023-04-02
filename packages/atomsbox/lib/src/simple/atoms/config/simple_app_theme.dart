import 'package:flutter/material.dart';

import '../../molecules/simple_card.dart';
import '../../molecules/simple_expansion_tile.dart';
import '../../molecules/simple_list_tile.dart';
import '../simple_icon_button.dart';
import '../simple_label.dart';
import '../simple_slider.dart';
import '../simple_button.dart';
import 'simple_color_scheme.dart';
import 'simple_text_theme.dart';

class SimpleTheme {
  static final ThemeData theme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: simpleColorSchemeLight,
    textTheme: simpleTextThemeLight,
    elevatedButtonTheme: simpleElevatedButtonThemeLight,
    textButtonTheme: simpleTextButtonThemeLight,
    outlinedButtonTheme: simpleOutlinedButtonThemeLight,
    iconButtonTheme: simpleIconButtonThemeLight,
    cardTheme: simpleCardThemeLight,
    expansionTileTheme: simpleExpansionTileThemeLight,
    sliderTheme: simpleSliderThemeLight,
    extensions: <ThemeExtension<dynamic>>[
      simpleListTileLight,
      simpleLabelLight,
    ],
  );

  static final ThemeData darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: simpleColorSchemeDark,
    textTheme: simpleTextThemeDark,
    elevatedButtonTheme: simpleElevatedButtonThemeDark,
    textButtonTheme: simpleTextButtonThemeDark,
    outlinedButtonTheme: simpleOutlinedButtonThemeDark,
    iconButtonTheme: simpleIconButtonThemeDark,
    expansionTileTheme: simpleExpansionTileThemeDark,
    cardTheme: simpleCardThemeDark,
    sliderTheme: simpleSliderThemeDark,
    extensions: <ThemeExtension<dynamic>>[
      simpleListTileDark,
      simpleLabelDark,
    ],
  );
}
