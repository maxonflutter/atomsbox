import 'package:flutter/material.dart';

import '../atoms/config/app_color_scheme.dart';
import '../atoms/config/app_constants.dart';

/// A custom list tile widget.
///
/// The [AppListTile] widget provides a consistent appearance and behavior for
/// list items in the application. It is a custom implementation of the Flutter
/// [ListTile] widget that aligns with the application's design language.
///
/// This widget can include a [leading] and [trailing] widget, a [title], and a
/// [subtitle]. Additionally, it provides optional properties such as [width],
/// [leadingWidth], and [isThreeLine] for further customization.
///
/// The appearance of the [AppListTile] is defined by the [AppListTileThemeData]
/// provided in the current [Theme].
///
/// ## Interactivity
///
/// The [AppListTile] is interactive by default. When tapped, it triggers the
/// [onTap] callback function, if provided. The tap effect is controlled by the
/// [splashColor] property in the [AppListTileThemeData].
///
/// See also:
///
/// * [AppListTileThemeData], which defines the appearance of the [AppListTile] widget.
/// * [ListTile], the Flutter widget that this custom implementation is based on.
class AppListTile extends StatelessWidget {
  /// Creates an [AppListTile] widget.
  ///
  /// The [title] must not be null.
  const AppListTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.width,
    this.leadingWidth = 48,
    this.isThreeLine = false,
  });

  /// Called when the user taps this list tile.
  ///
  /// If null, the list tile will be displayed without interactivity.
  final Function()? onTap;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or an [Image] widget.
  final Widget? leading;

  /// The overall width of the list tile.
  ///
  /// If null, the list tile will expand to the maximum width allowed by its parent.
  final double? width;

  /// The width of the leading widget.
  ///
  /// Defaults to 48.
  final double leadingWidth;

  /// A widget to display after the title and subtitle.
  ///
  /// Typically an [Icon] or a [Text] widget.
  final Widget? trailing;

  /// Whether this list tile displays three lines of text.
  ///
  /// If true, the subtitle can display up to three lines of text. If false (the default),
  /// the subtitle can display up to two lines of text.
  final bool isThreeLine;

  @override
  Widget build(BuildContext context) {
    final AppListTileThemeData themeData =
        Theme.of(context).extension<AppListTileThemeData>()!;

    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 48.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Material(
        color: themeData.backgroundColor,
        child: InkWell(
          splashColor: themeData.splashColor!.withOpacity(0.12),
          overlayColor: MaterialStatePropertyAll(
            themeData.splashColor!.withOpacity(0.12),
          ),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (leading != null)
                  ? ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstants.borderRadius),
                      child: SizedBox(
                        width: leadingWidth,
                        child: leading!,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: AppConstants.sm),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: themeData.foregroundColor),
                      child: title,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: AppConstants.sm * 0.5),
                      DefaultTextStyle(
                        maxLines: isThreeLine ? 3 : 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: themeData.foregroundColor),
                        child: subtitle!,
                      )
                    ]
                  ],
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.all(AppConstants.sm),
                  child: trailing!,
                )
            ],
          ),
        ),
      ),
    );
  }
}

/// A light theme data for the [AppListTile] widget.
///
/// This theme data uses a transparent background, a light on-surface foreground color,
/// and a primary color with 30% opacity for the splash effect.
///
/// See also:
///
/// * [AppListTileThemeData], which defines the appearance of the [AppListTile] widget.
final appListTileLight = AppListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: AppColors.appColorSchemeLight.onSurface,
  splashColor: AppColors.appColorSchemeLight.primary.withOpacity(0.3),
);

/// A dark theme data for the [AppListTile] widget.
///
/// This theme data uses a transparent background, a dark on-surface foreground color,
/// and a primary color with 30% opacity for the splash effect.
///
/// See also:
///
/// * [AppListTileThemeData], which defines the appearance of the [AppListTile] widget.
final appListTileDark = AppListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: AppColors.appColorSchemeDark.onSurface,
  splashColor: AppColors.appColorSchemeDark.primary.withOpacity(0.3),
);

/// A theme data class for customizing the appearance of [AppListTile] widgets.
///
/// The [AppListTileThemeData] class provides properties to customize the foreground
/// color, background color, and splash color of an [AppListTile].
///
/// It extends [ThemeExtension] and can be used with the [Theme] widget to
/// customize the appearance of all [AppListTile] widgets in a widget subtree.
///
/// See also:
///
/// * [AppListTile], a custom list tile widget that conforms to the application's
/// design language.
class AppListTileThemeData extends ThemeExtension<AppListTileThemeData> {
  /// Creates an [AppListTileThemeData] with the specified colors.
  ///
  /// The [foregroundColor], [backgroundColor], and [splashColor] properties must not be null.
  const AppListTileThemeData({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.splashColor,
  });

  /// The color to use for text and icons displayed in the [AppListTile].
  final Color? foregroundColor;

  /// The color to use for the background of the [AppListTile].
  final Color? backgroundColor;

  /// The color to use for the splash effect when the [AppListTile] is tapped.
  final Color? splashColor;

  /// Creates a copy of this [AppListTileThemeData] with the given fields replaced
  /// with the new values.

  @override
  AppListTileThemeData copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? splashColor,
  }) {
    return AppListTileThemeData(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  /// Linearly interpolate between two [AppListTileThemeData] objects.
  ///
  /// If either argument is null, this method returns the non-null argument.
  @override
  AppListTileThemeData lerp(AppListTileThemeData? other, double t) {
    if (other is! AppListTileThemeData) {
      return this;
    }
    return AppListTileThemeData(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      splashColor: Color.lerp(splashColor, other.splashColor, t),
    );
  }

  /// Returns a string representation of this [AppListTileThemeData].
  ///
  /// This is useful for debugging purposes.
  @override
  String toString() =>
      'AppListTileThemeData(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
}
