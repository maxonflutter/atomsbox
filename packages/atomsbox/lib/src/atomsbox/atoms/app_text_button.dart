import 'dart:ui';

import 'package:atomsbox/src/atomsbox/atoms/app_gradient_background.dart';
import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

class AppTextButton extends StatelessWidget {
  AppTextButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    primary = true;
    builder = (context) {
      return TextButton(
        style: TextButton.styleFrom(minimumSize: minimumSize),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppTextButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    primary = false;
    builder = (context) {
      return TextButton(
        style: TextButton.styleFrom(
          minimumSize: minimumSize,
          foregroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppTextButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGlass(
        child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: minimumSize,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    };
  }
  AppTextButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGradientBackground(
        child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: minimumSize,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    };
  }

  late ButtonBuilder builder;
  late final bool primary;
  final Function()? onPressed;
  final Size? minimumSize;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget button = builder.call(context);
    return button;
  }
}

final appTextButtonThemeLight = TextButtonThemeData(
  style: TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeLight.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeLight.shadow,
    surfaceTintColor: AppColors.appColorSchemeLight.surfaceTint,
  ),
);

final appTextButtonThemeDark = TextButtonThemeData(
  style: TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeDark.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeDark.shadow,
    surfaceTintColor: AppColors.appColorSchemeDark.surfaceTint,
  ),
);
