import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

class AppIconButton extends StatelessWidget {
  AppIconButton({
    super.key,
    this.onPressed,
    this.primary = true,
    required this.child,
  }) {
    builder = (context) {
      return IconButton(
        style: IconButton.styleFrom(),
        onPressed: onPressed,
        icon: child,
      );
    };
  }

  AppIconButton.secondary({
    super.key,
    this.onPressed,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        icon: child,
      );
    };
  }

  AppIconButton.glass({
    super.key,
    this.onPressed,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return Padding(
        padding: const EdgeInsets.all(AppConstants.sm * 0.5),
        child: ClipOval(
          child: AppGlass(
            child: SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: onPressed,
                icon: child,
              ),
            ),
          ),
        ),
      );
    };
  }
  AppIconButton.gradient({
    super.key,
    this.onPressed,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return Padding(
        padding: const EdgeInsets.all(AppConstants.sm * 0),
        child: ClipOval(
          child: AppGradient(
            child: SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: onPressed,
                icon: child,
              ),
            ),
          ),
        ),
      );
    };
  }

  late IconButtonBuilder builder;
  final Function()? onPressed;
  final bool primary;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget button = builder.call(context);
    return button;
  }
}

final appIconButtonThemeLight = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: AppColors.appColorSchemeLight.surface,
    backgroundColor: AppColors.appColorSchemeLight.primary,
    disabledForegroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeLight.shadow,
    surfaceTintColor: AppColors.appColorSchemeLight.surfaceTint,
  ),
);

final appIconButtonThemeDark = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: AppColors.appColorSchemeDark.surface,
    backgroundColor: AppColors.appColorSchemeDark.primary,
    disabledForegroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeDark.shadow,
    surfaceTintColor: AppColors.appColorSchemeDark.surfaceTint,
  ),
);
