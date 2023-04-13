import 'package:flutter/material.dart';

import '../atoms/config/app_breakpoints.dart';
import '../atoms/config/app_constants.dart';
import '../molecules/app_text_block.dart';

/// A responsive grid widget.
///
/// The [AppGrid] widget displays a grid of items with an optional title and
/// description. The grid is responsive and its layout settings can be
/// customized for different device sizes.
///
/// See also:
///
/// * [AppTextBlock], which is used to display the title and description.
/// * [AppGridSettings], which defines the grid layout settings for different
/// device sizes.
class AppGrid extends StatelessWidget {
  /// Creates a responsive grid widget.
  ///
  /// The [gridItems] and [gridSettings] parameters must not be null.

  const AppGrid({
    super.key,
    this.title,
    this.description,
    required this.gridItems,
    required this.gridSettings,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  /// The optional title widget to display at the top of the grid.
  final Widget? title;

  /// The optional description widget to display below the title.
  final Widget? description;

  /// The fixed height of the grid, if needed.
  final double? height;

  /// The scrolling physics for the grid.
  ///
  /// Defaults to [NeverScrollableScrollPhysics].
  final ScrollPhysics? physics;

  /// The layout settings for the grid on different device sizes.
  ///
  /// Must not be null.
  final AppGridSettings gridSettings;

  /// The list of items to display in the grid.
  ///
  /// Must not be null.
  final List<Widget> gridItems;

  @override
  Widget build(BuildContext context) {
    SliverGridDelegateWithFixedCrossAxisCount gridDelegate;

    if (AppBreakpoints.isDesktop(context)) {
      gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSettings.desktopCrossAxisCount,
        mainAxisSpacing: gridSettings.desktopMainAxisSpacing,
        crossAxisSpacing: gridSettings.desktopCrossAxisSpacing,
        childAspectRatio: gridSettings.desktopChildAspectRatio,
      );
    } else if (AppBreakpoints.isTablet(context)) {
      gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSettings.tabletCrossAxisCount,
        mainAxisSpacing: gridSettings.tabletMainAxisSpacing,
        crossAxisSpacing: gridSettings.tabletCrossAxisSpacing,
        childAspectRatio: gridSettings.tabletChildAspectRatio,
      );
    } else {
      gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSettings.crossAxisCount,
        mainAxisSpacing: gridSettings.mainAxisSpacing,
        crossAxisSpacing: gridSettings.crossAxisSpacing,
        childAspectRatio: gridSettings.childAspectRatio,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBlock(title: title, subtitle: description),
        SizedBox(
          height: height,
          child: GridView.builder(
            shrinkWrap: true,
            physics: physics,
            padding: EdgeInsets.zero,
            itemCount: gridItems.length,
            gridDelegate: gridDelegate,
            itemBuilder: (context, index) => gridItems[index],
          ),
        ),
      ],
    );
  }
}

/// A class that defines grid layout settings for different device sizes.
///
/// The layout settings include the number of items per row, spacing between
/// items, and child aspect ratio.
class AppGridSettings {
  // Default settings
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;

  // Tablet settings
  final int tabletCrossAxisCount;
  final double tabletMainAxisSpacing;
  final double tabletCrossAxisSpacing;
  final double tabletChildAspectRatio;

  // Desktop settings
  final int desktopCrossAxisCount;
  final double desktopMainAxisSpacing;
  final double desktopCrossAxisSpacing;
  final double desktopChildAspectRatio;

  const AppGridSettings({
    this.crossAxisCount = 1,
    this.mainAxisSpacing = AppConstants.sm,
    this.crossAxisSpacing = AppConstants.sm,
    this.childAspectRatio = 1.0,
    this.tabletCrossAxisCount = 2,
    this.tabletMainAxisSpacing = AppConstants.sm,
    this.tabletCrossAxisSpacing = AppConstants.sm,
    this.tabletChildAspectRatio = 1.0,
    this.desktopCrossAxisCount = 3,
    this.desktopMainAxisSpacing = AppConstants.sm,
    this.desktopCrossAxisSpacing = AppConstants.sm,
    this.desktopChildAspectRatio = 1.0,
  });
}
