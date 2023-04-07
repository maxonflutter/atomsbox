import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = true,
    required this.child,
  }) {
    builder = (context) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: minimumSize,
          foregroundColor:
              primary ? null : Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppElevatedButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: minimumSize,
          foregroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  AppElevatedButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGlass(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: minimumSize,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    };
  }

  AppElevatedButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
    this.primary = false,
    required this.child,
  }) {
    builder = (context) {
      return AppGradient(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: minimumSize,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
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

final appElevatedButtonThemeLight = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeLight.primary,
    backgroundColor: AppColors.appColorSchemeLight.surface,
    disabledForegroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeLight.shadow,
    surfaceTintColor: AppColors.appColorSchemeLight.surfaceTint,
  ),
);

final appElevatedButtonThemeDark = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: AppColors.appColorSchemeDark.primary,
    backgroundColor: AppColors.appColorSchemeDark.surface,
    disabledForegroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        AppColors.appColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: AppColors.appColorSchemeDark.shadow,
    surfaceTintColor: AppColors.appColorSchemeDark.surfaceTint,
  ),
);
