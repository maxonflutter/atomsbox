import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient_background.dart';
import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

/// A versatile elevated button widget with multiple styles.
///
/// The [AppElevatedButton] widget is a customizable elevated button that can be
/// styled in different ways, such as with primary or secondary colors, glass
/// effect, or a gradient background.
///
/// The button takes in a required [child] widget, which is typically a [Text]
/// widget that displays the button's label.
///
/// The [onPressed] callback will be called when the button is tapped.
///
/// Use the different constructors to create the desired button style:
/// * [AppElevatedButton] for primary style.
/// * [AppElevatedButton.secondary] for secondary style.
/// * [AppElevatedButton.glass] for glass effect style.
/// * [AppElevatedButton.gradient] for gradient background style.
///
/// See also:
///
/// * [ElevatedButton], the base elevated button widget in Flutter.
/// * [Text], the widget used for displaying the button's label.
class AppElevatedButton extends StatelessWidget {
  /// Creates a primary style elevated button.
  ///
  /// The [child] parameter must not be null.
  AppElevatedButton({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: minimumSize),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  /// Creates a secondary style elevated button.
  ///
  /// The [child] parameter must not be null.
  AppElevatedButton.secondary({
    super.key,
    this.onPressed,
    this.minimumSize,
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

  /// Creates a glass effect style elevated button.
  ///
  /// The [child] parameter must not be null.
  AppElevatedButton.glass({
    super.key,
    this.onPressed,
    this.minimumSize,
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

  /// Creates a gradient background style elevated button.
  ///
  /// The [child] parameter must not be null.
  AppElevatedButton.gradient({
    super.key,
    this.onPressed,
    this.minimumSize,
    required this.child,
  }) {
    builder = (context) {
      return AppGradientBackground(
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

  /// Internal builder for creating an [ElevatedButton] with the specified style.
  late ButtonBuilder builder;

  /// The callback that is called when the button is tapped or otherwise activated.
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
