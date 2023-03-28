import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';

/// A simple bottom navigation bar widget.
///
/// The [SimpleBottomNavBar] widget displays a row of items within a container
/// at the bottom of the screen. It supports two styles, floating and non-floating.
/// The floating style has a smaller height and symmetrical margin while the
/// non-floating style has a larger height and padding at the top, left, and right.
///
/// The [items] argument is required and should contain a list of widgets to be
/// displayed as navigation items.
///
/// The [floating] argument is optional and defaults to true. When set to true,
/// the navigation bar will have a floating style. When set to false, it will
/// have a non-floating style.
///
/// ## Usage
///
/// Typically used within a [Scaffold] widget's [Scaffold.bottomNavigationBar]
/// property to display a custom bottom navigation bar.
///
/// See also:
///
/// * [BottomNavigationBar], which is a Material Design bottom navigation bar.
///
class SimpleBottomNavBar extends StatelessWidget {
  const SimpleBottomNavBar({
    super.key,
    required this.items,
    this.floating = true,
  });

  /// The list of widgets to be displayed as navigation items.
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
