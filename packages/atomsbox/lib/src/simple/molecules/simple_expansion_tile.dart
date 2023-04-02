import 'package:flutter/material.dart';

import '../atoms/config/simple_color_scheme.dart';
import '../atoms/config/simple_constants.dart';

import 'package:flutter/material.dart';

typedef ExpansionTileBuilder = ExpansionTileTheme Function(
  BuildContext context,
);

class SimpleExpansionTile extends StatelessWidget {
  SimpleExpansionTile({
    super.key,
    this.initiallyExpanded = false,
    required this.title,
    this.leading,
    this.trailing,
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
          children: children ?? [],
        ),
      );
    };
  }

  SimpleExpansionTile.transparent({
    super.key,
    this.initiallyExpanded = false,
    required this.title,
    this.leading,
    this.trailing,
    this.children,
  }) {
    builder = (context) {
      return ExpansionTileTheme(
        data: Theme.of(context).expansionTileTheme.copyWith(
              collapsedBackgroundColor: Colors.transparent,
              collapsedIconColor: Theme.of(context).colorScheme.primary,
              collapsedTextColor: Theme.of(context).colorScheme.primary,
            ),
        child: ExpansionTile(
          title: title,
          leading: leading,
          trailing: trailing,
          children: children ?? [],
        ),
      );
    };
  }

  late ExpansionTileBuilder builder;
  final bool initiallyExpanded;
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final expansionTile = builder.call(context);
    return expansionTile;
  }
}

final simpleExpansionTileThemeLight = ExpansionTileThemeData(
  collapsedBackgroundColor: simpleColorSchemeLight.primary,
  backgroundColor: Colors.transparent,
  expandedAlignment: Alignment.centerLeft,
  collapsedShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
  collapsedIconColor: simpleColorSchemeLight.onPrimary,
  collapsedTextColor: simpleColorSchemeLight.onPrimary,
  tilePadding: const EdgeInsets.symmetric(horizontal: SimpleConstants.sm),
  childrenPadding: const EdgeInsets.all(SimpleConstants.sm),
);

final simpleExpansionTileThemeDark = ExpansionTileThemeData(
  collapsedBackgroundColor: simpleColorSchemeDark.primary,
  backgroundColor: Colors.transparent,
  expandedAlignment: Alignment.centerLeft,
  collapsedShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
  collapsedIconColor: simpleColorSchemeDark.onPrimary,
  collapsedTextColor: simpleColorSchemeDark.onPrimary,
  tilePadding: const EdgeInsets.symmetric(horizontal: SimpleConstants.sm),
  childrenPadding: const EdgeInsets.all(SimpleConstants.sm),
);
