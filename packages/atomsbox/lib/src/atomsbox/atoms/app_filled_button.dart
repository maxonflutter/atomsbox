import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient_background.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

/// A custom filled button widget with various styles.
///
/// The [AppFilledButton] is a custom [FilledButton] that supports different
/// styles such as primary, secondary, glass, and gradient. It is a convenient
/// way to use filled buttons with predefined styles in your application.
///
/// The [onPressed] callback is called when the button is tapped or activated.
///
/// The [minimumSize] property sets the minimum size constraints for the button.
///
/// The [child] property is the widget displayed as the button's label.

// ignore: must_be_immutable
class AppFilledButton extends StatelessWidget {
  /// Creates a primary styled filled button.
  ///
  /// The [child] parameter must not be null.

  AppFilledButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return FilledButton(
        style: FilledButton.styleFrom(minimumSize: minimumSize),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  /// Creates a secondary styled filled button.
  ///
  /// The [child] parameter must not be null.
  AppFilledButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return FilledButton(
        style: FilledButton.styleFrom(
          minimumSize: minimumSize,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  /// Creates a glass styled filled button.
  ///
  /// The [child] parameter must not be null.
  AppFilledButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return AppGlass(
        child: FilledButton(
          style: FilledButton.styleFrom(
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

  /// Creates a gradient styled filled button.
  ///
  /// The [child] parameter must not be null.
  AppFilledButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return AppGradientBackground(
        child: FilledButton(
          style: FilledButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: minimumSize,
            side: BorderSide.none,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
    };
  }

  /// Internal builder for creating an [FilledButton] with the specified style.
  late ButtonBuilder builder;

  /// The callback that is called when the button is tapped or activated.
  ///
  /// If this is set to null, the button will be disabled.
  final Function()? onPressed;

  /// The minimum size of the button.
  ///
  /// If non-null, the button will constrain its size to be at least as large as
  /// the given size. If null, the button will use its default minimum size constraints.
  final Size? minimumSize;

  /// The widget that is displayed as the button's label.
  ///
  /// Typically a [Text] widget that contains the text label for the button.
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
    minimumSize: const Size(100, 36),
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
    minimumSize: const Size(100, 36),
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
