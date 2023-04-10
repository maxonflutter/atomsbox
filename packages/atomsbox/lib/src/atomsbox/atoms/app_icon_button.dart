import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient_background.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

/// A customizable icon button with various styles.
///
/// The [AppIconButton] widget provides multiple constructors to create icon buttons
/// with different appearances, such as primary, secondary, glass, and gradient styles.
///
/// The [onPressed] callback will be called when the button is tapped. The button takes in a required
/// [child] widget, which is typically a [Icon] widget.
///
/// The [onPressed] callback will be called when the button is tapped.
///
/// Use the different constructors to create the desired button style:
/// * [AppIconButton] for primary style.
/// * [AppIconButton.secondary] for secondary style.
/// * [AppIconButton.glass] for glass effect style.
/// * [AppIconButton.gradient] for gradient background style.
///
/// See also:
///
/// * [IconButton], which is the base widget used to create the different styles of [AppIconButton].
class AppIconButton extends StatelessWidget {
  /// Creates an [AppIconButton] with the primary style.
  ///
  /// The [child] parameter must not be null.
  AppIconButton({
    super.key,
    this.onPressed,
    required this.child,
  }) {
    builder = (context) {
      return IconButton(
        onPressed: onPressed,
        icon: child,
      );
    };
  }

  /// Creates an [AppIconButton] with the secondary style.
  ///
  /// The [child] parameter must not be null.

  AppIconButton.secondary({
    super.key,
    this.onPressed,
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

  /// Creates an [AppIconButton] with the glass style.
  ///
  /// The [child] parameter must not be null.
  AppIconButton.glass({
    super.key,
    this.onPressed,
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
                  foregroundColor: Theme.of(context).colorScheme.primary,
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

  /// Creates an [AppIconButton] with the gradient style.
  ///
  /// The [child] parameter must not be null.
  AppIconButton.gradient({
    super.key,
    this.onPressed,
    required this.child,
  }) {
    builder = (context) {
      return Padding(
        padding: const EdgeInsets.all(AppConstants.sm * 0),
        child: ClipOval(
          child: AppGradientBackground(
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

  /// A callback that returns an [IconButton] with the desired style.
  late IconButtonBuilder builder;

  /// The callback that is called when the button is tapped.
  ///
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The icon to display inside the button.
  ///
  /// This should typically be an [Icon] widget, but can be any [Widget] that
  /// visually represents the button's intended action.
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
