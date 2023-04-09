import 'package:flutter/material.dart';

import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'app_text.dart';

/// A custom label widget that displays a text string and an optional icon.
///
/// The [AppLabel] widget can be used to display a styled text string with an
/// optional icon, based on the current theme data. It provides a consistent
/// appearance for labels across the application.
///
/// This widget can be customized to display a primary or secondary label style
/// based on the [primary] property. By default, it uses the primary label style.
///
/// See also:
///
/// * [AppLabelThemeData], which defines the appearance of labels.
class AppLabel extends StatelessWidget {
  /// Creates a custom label widget with the given text and optional icon.
  ///
  /// The [text] parameter must not be null. The [icon] parameter is optional.
  ///
  /// If the [primary] parameter is true, the widget uses the primary label style.
  /// Otherwise, it uses the secondary label style.

  const AppLabel({
    super.key,
    required this.text,
    this.icon,
    this.primary = true,
  });

  /// The text string to display in the label.
  final String text;

  /// The optional icon to display next to the text.
  final IconData? icon;

  /// Whether the label should use the primary label style.
  ///
  /// If true, the widget uses the primary label style. Otherwise, it uses the
  /// secondary label style.
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final AppLabelThemeData themeData;

    if (primary) {
      themeData = Theme.of(context).extension<AppLabelThemeData>()!;
    } else {
      themeData = Theme.of(context).extension<AppLabelThemeData>()!.copyWith(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          );
    }

    return Container(
      padding: const EdgeInsets.all(AppConstants.sm),
      decoration: BoxDecoration(
        color: themeData.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...(icon == null)
              ? [const SizedBox()]
              : [
                  Icon(icon, color: themeData.foregroundColor),
                  const SizedBox(width: AppConstants.sm),
                ],
          AppText(text),
        ],
      ),
    );
  }
}

/// A set of predefined [AppLabelThemeData] for light and dark themes.
///
/// These instances can be used to apply a consistent label appearance across
/// the application, depending on the current theme mode (light or dark).
///
/// See also:
///
/// * [AppLabelThemeData], which defines the appearance of labels.
/// * [AppColors], which contains predefined color schemes for the application.
final appLabelLight = AppLabelThemeData(
  backgroundColor: AppColors.appColorSchemeLight.primaryContainer,
  foregroundColor: AppColors.appColorSchemeLight.onPrimaryContainer,
);

final appLabelDark = AppLabelThemeData(
  backgroundColor: AppColors.appColorSchemeDark.primaryContainer,
  foregroundColor: AppColors.appColorSchemeDark.onPrimaryContainer,
);

/// A theme extension for customizing label appearance.
///
/// The [AppLabelThemeData] provides customization options for label foreground and background colors.
/// It extends [ThemeExtension] to support theme extension-specific behaviors, such as copying
/// and interpolating between two instances of [AppLabelThemeData].
///
/// See also:
///
/// * [ThemeExtension], which is the base class that [AppLabelThemeData] extends.
class AppLabelThemeData extends ThemeExtension<AppLabelThemeData> {
  /// Creates an [AppLabelThemeData] with the provided foreground and background colors.
  ///
  /// Both [foregroundColor] and [backgroundColor] parameters must not be null.
  const AppLabelThemeData({
    required this.foregroundColor,
    required this.backgroundColor,
  });

  /// The color to use for the text of the label.
  final Color? foregroundColor;

  /// The color to use for the background of the label.
  final Color? backgroundColor;

  /// Returns a new [AppLabelThemeData] with the specified properties replaced.
  ///
  /// The original [AppLabelThemeData] remains unchanged.
  @override
  AppLabelThemeData copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
  }) {
    return AppLabelThemeData(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  /// Returns a new [AppLabelThemeData] that interpolates between this and [other] based on [t].
  ///
  /// If [other] is not an instance of [AppLabelThemeData], returns this unchanged.
  @override
  AppLabelThemeData lerp(AppLabelThemeData? other, double t) {
    if (other is! AppLabelThemeData) {
      return this;
    }
    return AppLabelThemeData(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }

// Optional
  @override
  String toString() =>
      'AppLabelThemeData(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
}
