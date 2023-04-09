import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient_background.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

/// A versatile outlined button with various styles.
///
/// The [AppOutlinedButton] widget displays an outlined button with a single child
/// and can have various styles, including primary, secondary, glass, and gradient
/// backgrounds. This widget is a convenient way to create multiple button styles
/// using a single class.
///
/// The constructors [AppOutlinedButton.secondary], [AppOutlinedButton.glass], and
/// [AppOutlinedButton.gradient] create buttons with different styles.
///
/// The [minimumSize] argument is optional and allows you to set the minimum size
/// of the button.
///
/// The [onPressed] callback is called when the button is tapped.
///
/// The [child] argument is required and contains the widget to display inside the button.
///
/// See also:
///
/// * [OutlinedButton], which is the base widget for creating outlined buttons.
class AppOutlinedButton extends StatelessWidget {
  /// Creates an [AppOutlinedButton] with the primary style.
  ///
  /// The [child] parameter must not be null.
  AppOutlinedButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: minimumSize,
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  /// Creates an [AppOutlinedButton] with the secondary style.
  ///
  /// The [child] parameter must not be null.
  AppOutlinedButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
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

  /// Creates an [AppOutlinedButton] with a glass style.
  ///
  /// The [child] parameter must not be null.
  AppOutlinedButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
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

  /// Creates an [AppOutlinedButton] with a gradient background.
  ///
  /// The [child] parameter must not be null.
  AppOutlinedButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
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

  /// The builder function to create a button with the desired style.
  late ButtonBuilder builder;

  /// The callback function that is called when the button is tapped.
  ///
  /// If null, the button will be disabled.
  final Function()? onPressed;

  /// The minimum size of the button.
  ///
  /// If null, the button will have a default minimum size.
  final Size? minimumSize;

  /// The widget to display inside the button.
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
