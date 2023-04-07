import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../molecules/app_expansion_tile.dart';
import '../../molecules/app_list_tile.dart';
import '../app_card_container.dart';
import '../app_elevated_button.dart';
import '../app_icon_button.dart';
import '../app_label.dart';
import '../app_outlined_button.dart';
import '../app_slider.dart';
import '../app_text_button.dart';
import '../app_card_container.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.light(useMaterial3: true).copyWith(
    primaryColorDark:
        AppColors.getMaterialColorFromColor(AppColors.primarySeedColor)
            .shade600,
    primaryColorLight:
        AppColors.getMaterialColorFromColor(AppColors.primarySeedColor)
            .shade100,
    colorScheme: AppColors.appColorSchemeLight,
    textTheme: appTextThemeLight,
    elevatedButtonTheme: appElevatedButtonThemeLight,
    filledButtonTheme: appFilledButtonThemeLight,
    textButtonTheme: appTextButtonThemeLight,
    outlinedButtonTheme: appOutlinedButtonThemeLight,
    iconButtonTheme: appIconButtonThemeLight,
    cardTheme: appCardContainerThemeLight,
    expansionTileTheme: appExpansionTileThemeLight,
    sliderTheme: appSliderThemeLight,
    extensions: <ThemeExtension<dynamic>>[appListTileLight, appLabelLight],
  );

  static final ThemeData darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith(
    primaryColorDark:
        AppColors.getMaterialColorFromColor(AppColors.primarySeedColor)
            .shade600,
    primaryColorLight:
        AppColors.getMaterialColorFromColor(AppColors.primarySeedColor)
            .shade100,
    colorScheme: AppColors.appColorSchemeDark,
    textTheme: appTextThemeDark,
    elevatedButtonTheme: appElevatedButtonThemeDark,
    filledButtonTheme: appFilledButtonThemeDark,
    textButtonTheme: appTextButtonThemeDark,
    outlinedButtonTheme: appOutlinedButtonThemeDark,
    iconButtonTheme: appIconButtonThemeDark,
    expansionTileTheme: appExpansionTileThemeDark,
    cardTheme: appCardContainerThemeDark,
    sliderTheme: appSliderThemeDark,
    extensions: <ThemeExtension<dynamic>>[appListTileDark, appLabelDark],
  );
}
