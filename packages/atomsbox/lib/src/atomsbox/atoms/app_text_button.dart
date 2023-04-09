import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient_background.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

/// A customizable text button widget that provides multiple styles.
///
/// The [AppTextButton] widget displays a button with text as its child and
/// offers various styles including secondary, glass, and gradient backgrounds.
/// The button's appearance and behavior can be customized using the provided
/// constructor parameters.
///
/// The [onPressed] parameter is a callback function that is called when the
/// button is tapped.
///
/// The [minimumSize] parameter is an optional value that sets the minimum size
/// of the button. If not provided, the button will have the default minimum size.
///
/// The [child] parameter is a required widget, typically a [Text] widget, that
/// is displayed as the button's content.
///
/// /// class AppTextButton extends StatelessWidget { /// ... /// } ///
///
/// There are also named constructors for different button styles:
///
/// * [AppTextButton.secondary]: Creates a button with the secondary text color.
/// * [AppTextButton.glass]: Creates a button with a glass-like appearance.
/// * [AppTextButton.gradient]: Creates a button with a gradient background.
///
/// ## Example
///
/// dart /// AppTextButton( /// onPressed: () { /// print('Button pressed'); /// }, /// child: Text('Press me'), /// ) /// ///
/// See also:
///
/// * [TextButton], which is the base Flutter widget used to create the custom styles.
/// * [Theme], which is used to provide the default text and background colors.

class AppTextButton extends StatelessWidget {
  /// Creates a basic text button widget.
  ///
  /// The [child] parameter must not be null.
  AppTextButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return TextButton(
        style: TextButton.styleFrom(minimumSize: minimumSize),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  /// Creates a text button widget with a secondary text color.
  ///
  /// The [child] parameter must not be null.
  AppTextButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
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

  /// Creates a text button widget with a glass-like appearance.
  ///
  /// The [child] parameter must not be null.
  AppTextButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
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

  /// Creates a text button widget with a gradient background.
  ///
  /// The [child] parameter must not be null.
  AppTextButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
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

  /// The [ButtonBuilder] used to build the custom button.
  ///
  /// Depending on the constructor used, this builder will create a button with
  /// the desired style.
  late ButtonBuilder builder;

  /// The callback function that is called when the button is tapped.
  ///
  /// If this is null, the button will be disabled.
  final Function()? onPressed;

  /// The minimum size of the button.
  ///
  /// If this is null, the button will have the default minimum size.
  final Size? minimumSize;

  /// The content of the button, typically a [Text] widget.
  ///
  /// This parameter must not be null.
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
