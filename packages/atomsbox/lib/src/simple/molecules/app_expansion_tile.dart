import 'package:atomsbox/src/simple/atoms/app_gradient.dart';
import 'package:flutter/material.dart';

import '../atoms/config/app_color_scheme.dart';
import '../atoms/config/app_constants.dart';
import '../atoms/config/app_typedef.dart';

class AppExpansionTile extends StatelessWidget {
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
        child: AppGradient(
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

  late ExpansionTileBuilder builder;
  final bool initiallyExpanded;
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final Function(bool)? onExpansionChanged;
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
