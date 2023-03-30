import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';

/// A simple bottom navigation bar with customizable appearance.
///
/// The [SimpleBottomNavBar] widget displays a horizontal list of items, which
/// can be used for navigation between different screens or sections of the app.
/// The items are spaced evenly across the available space.
///
/// The [floating] argument is optional and defaults to true. When true, the
/// navigation bar will be displayed with a floating appearance, and when false,
/// it will be displayed with a non-floating appearance. The height, margin,
/// and padding will change based on the floating state.
///
/// The navigation bar's background color is determined by the primary color of
/// the current [Theme] with an alpha value of 200. It also has a customizable
/// border radius defined by [SimpleConstants.borderRadius].
///
/// See also:
/// * [BottomNavigationBar], which is a Material Design bottom navigation bar.
///
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
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
    );

    if (floating == true) {
      height = 60.0;
      margin = const EdgeInsets.symmetric(
        horizontal: SimpleConstants.xlg,
        vertical: SimpleConstants.lg,
      );
    } else {
      height = 85.0;
      padding = const EdgeInsets.only(
        top: SimpleConstants.sm,
        left: SimpleConstants.xlg,
        right: SimpleConstants.xlg,
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
