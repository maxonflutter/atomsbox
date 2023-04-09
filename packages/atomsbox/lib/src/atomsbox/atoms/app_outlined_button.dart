import 'dart:ui';

import 'package:atomsbox/src/atomsbox/atoms/app_gradient_background.dart';
import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

class AppOutlinedButton extends StatelessWidget {
  AppOutlinedButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = true,
    required this.child,
  }) {
    builder = (context) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: minimumSize,
          foregroundColor:
              primary ? null : Theme.of(context).colorScheme.secondary,
          side: primary
              ? null
              : BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppOutlinedButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: minimumSize,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppOutlinedButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGlass(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: minimumSize,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    };
  }
  AppOutlinedButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGradientBackground(
        colors: [
          Theme.of(context).colorScheme.primaryContainer,
          Theme.of(context).colorScheme.secondaryContainer
        ],
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(minimumSize: minimumSize),
          onPressed: onPressed,
          child: child,
        ),
      );
    };
  }

  late ButtonBuilder builder;
  final Function()? onPressed;
  final Size? minimumSize;
  final bool primary;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget button = builder.call(context);
    return button;
  }
}

final appOutlinedButtonThemeDark = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      side: BorderSide(
        color: AppColors.appColorSchemeDark.primary,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    ),
    side: BorderSide(color: AppColors.appColorSchemeDark.primary),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeDark.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: null,
    surfaceTintColor: null,
  ),
);
final appOutlinedButtonThemeLight = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    side: BorderSide(
      color: AppColors.appColorSchemeLight.primary,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeLight.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: null,
    surfaceTintColor: null,
  ),
);
