import 'package:atomsbox/src/atomsbox/atoms/app_gradient_background.dart';
import 'package:flutter/material.dart';

import '../atoms/config/app_color_scheme.dart';
import '../atoms/config/app_constants.dart';
import '../atoms/config/app_typedef.dart';

/// A custom expansion tile widget that follows the application's design language.
///
/// The [AppExpansionTile] widget displays a title and an optional leading and
/// trailing widget. The tile can be expanded or collapsed to reveal or hide
/// its children widgets.
///
/// The widget provides three constructors to create different styles of
/// expansion tiles: the default [AppExpansionTile], [AppExpansionTile.secondary],
/// and [AppExpansionTile.gradient].
///
/// See also:
///
/// * [ExpansionTile], the Flutter widget that this custom widget is based on.
/// * [ExpansionTileThemeData], which defines the appearance of the
/// [ExpansionTile] widget.
class AppExpansionTile extends StatelessWidget {
  /// Creates an [AppExpansionTile] with the default appearance.
  ///
  /// If the [initiallyExpanded] property is true, the tile is initially expanded.

  AppExpansionTile({
    super.key,
    this.initiallyExpanded = false,
    required this.title,
    this.leading,
    this.trailing,
    this.onExpansionChanged,
    this.children,
  }) {
    builder = (context) {
      return ExpansionTileTheme(
        data: Theme.of(context).expansionTileTheme,
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          title: title,
          leading: leading,
          trailing: trailing,
          onExpansionChanged: onExpansionChanged,
          children: children ?? [],
        ),
      );
    };
  }

  /// Creates an [AppExpansionTile] with a secondary appearance.
  ///
  /// If the [initiallyExpanded] property is true, the tile is initially expanded.

  AppExpansionTile.secondary({
    super.key,
    this.initiallyExpanded = false,
    required this.title,
    this.leading,
    this.trailing,
    this.onExpansionChanged,
    this.children,
  }) {
    builder = (context) {
      return ExpansionTileTheme(
        data: Theme.of(context).expansionTileTheme.copyWith(
              textColor: Theme.of(context).colorScheme.secondary,
              collapsedBackgroundColor: Theme.of(context).colorScheme.secondary,
              collapsedIconColor: Theme.of(context).colorScheme.onSecondary,
              collapsedTextColor: Theme.of(context).colorScheme.onSecondary,
            ),
        child: ExpansionTile(
          title: title,
          leading: leading,
          trailing: trailing,
          onExpansionChanged: onExpansionChanged,
          children: children ?? [],
        ),
      );
    };
  }

  /// Creates an [AppExpansionTile] with a gradient background.
  ///
  /// If the [initiallyExpanded] property is true, the tile is initially expanded.

  AppExpansionTile.gradient({
    super.key,
    this.initiallyExpanded = false,
    required this.title,
    this.leading,
    this.trailing,
    this.onExpansionChanged,
    this.children,
  }) {
    builder = (context) {
      return ExpansionTileTheme(
        data: Theme.of(context).expansionTileTheme.copyWith(
              backgroundColor: Theme.of(context).colorScheme.background,
              collapsedBackgroundColor: Colors.transparent,
              collapsedIconColor: Theme.of(context).colorScheme.onPrimary,
            ),
        child: AppGradientBackground(
          child: ExpansionTile(
            title: title,
            leading: leading,
            trailing: trailing,
            onExpansionChanged: onExpansionChanged,
            children: children ?? [],
          ),
        ),
      );
    };
  }

  /// A builder for creating an [ExpansionTile] with the theme data applied.
  late ExpansionTileBuilder builder;

  /// Whether the tile is initially expanded.
  final bool initiallyExpanded;

  /// The primary content of the tile.
  final Widget title;

  /// An optional widget to display before the title.
  final Widget? leading;

  /// An optional widget to display after the title.
  final Widget? trailing;

  /// Called when the tile expands or collapses.
  final Function(bool)? onExpansionChanged;

  /// The widgets that are revealed when the tile is expanded.
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final expansionTile = builder.call(context);
    return expansionTile;
  }
}

final appExpansionTileThemeLight = ExpansionTileThemeData(
  collapsedBackgroundColor: AppColors.appColorSchemeLight.primary,
  backgroundColor: Colors.transparent,
  expandedAlignment: Alignment.centerLeft,
  collapsedShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
  collapsedIconColor: AppColors.appColorSchemeLight.onPrimary,
  collapsedTextColor: AppColors.appColorSchemeLight.onPrimary,
  tilePadding: const EdgeInsets.symmetric(horizontal: AppConstants.sm),
  childrenPadding: const EdgeInsets.all(AppConstants.sm),
);

final appExpansionTileThemeDark = ExpansionTileThemeData(
  collapsedBackgroundColor: AppColors.appColorSchemeDark.primary,
  backgroundColor: Colors.transparent,
  expandedAlignment: Alignment.centerLeft,
  collapsedShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
  collapsedIconColor: AppColors.appColorSchemeDark.onPrimary,
  collapsedTextColor: AppColors.appColorSchemeDark.onPrimary,
  tilePadding: const EdgeInsets.symmetric(horizontal: AppConstants.sm),
  childrenPadding: const EdgeInsets.all(AppConstants.sm),
);
