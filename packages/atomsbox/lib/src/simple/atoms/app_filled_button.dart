import 'dart:ui';

import 'package:atomsbox/src/simple/atoms/app_gradient.dart';
import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

class AppFilledButton extends StatelessWidget {
  AppFilledButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    primary = true;
    builder = (context) {
      return FilledButton(
        style: FilledButton.styleFrom(minimumSize: minimumSize),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppFilledButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    primary = false;
    builder = (context) {
      return FilledButton(
        style: FilledButton.styleFrom(
          minimumSize: minimumSize,
          foregroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppFilledButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGlass(
        child: FilledButton(
          style: FilledButton.styleFrom(
            minimumSize: minimumSize,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    };
  }
  AppFilledButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGradient(
        child: FilledButton(
          style: FilledButton.styleFrom(
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

final appFilledButtonThemeLight = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeLight.onPrimary,
    backgroundColor: AppColors.appColorSchemeLight.primary,
    disabledForegroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeLight.shadow,
    surfaceTintColor: AppColors.appColorSchemeLight.surfaceTint,
  ),
);

final appFilledButtonThemeDark = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeLight.onPrimary,
    backgroundColor: AppColors.appColorSchemeLight.primary,
    disabledForegroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeDark.shadow,
    surfaceTintColor: AppColors.appColorSchemeDark.surfaceTint,
  ),
);
