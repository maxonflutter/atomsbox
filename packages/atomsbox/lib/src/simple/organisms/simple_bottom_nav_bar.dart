import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

class SimpleBottomNavBar extends StatelessWidget {
  const SimpleBottomNavBar({
    super.key,
    required this.items,
    this.floating = true,
  });

  /// The list of widgets that will be displayed as items in the navigation bar.
  ///
  /// Typically, these will be [Icon] or [Text] widgets. They should be of a
  /// similar size to ensure proper alignment and spacing.
  final List<Widget> items;

  /// Whether the navigation bar should have a floating style.
  ///
  /// When set to true, the navigation bar will have a smaller height and
  /// symmetrical margin. When set to false, it will have a larger height and
  /// padding at the top, left, and right.
  final bool floating;

  @override
  Widget build(BuildContext context) {
    double height;
    EdgeInsets? margin;
    EdgeInsets? padding;

    var decoration = BoxDecoration(
      color: Theme.of(context).colorScheme.primary.withAlpha(200),
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
    );

    if (floating == true) {
      height = 60.0;
      margin = const EdgeInsets.symmetric(
        horizontal: AppConstants.xlg,
        vertical: AppConstants.lg,
      );
    } else {
      height = 85.0;
      padding = const EdgeInsets.only(
        top: AppConstants.sm,
        left: AppConstants.xlg,
        right: AppConstants.xlg,
      );
    }

    return floating
        ? Container(
            height: height,
            margin: margin,
            decoration: decoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            ),
          )
        : Container(
            height: height,
            padding: padding,
            decoration: decoration,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items,
              ),
            ),
          );
  }
}
