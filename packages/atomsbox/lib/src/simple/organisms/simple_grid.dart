import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_text.dart';

/// A simple grid layout for displaying a list of widgets.
///
/// The [SimpleGrid] widget arranges its children in a grid layout with a
/// specified number of items in the cross axis, and fixed item width and height
/// ratios. It supports an optional title and custom scroll physics.
///
/// By default, the grid has 2 items in the cross axis, and items have a width
/// and height ratio of 1:1.
///
/// See also:
/// * [GridView], which is the underlying widget used to create the grid layout.
/// * [ScrollPhysics], which can be customized to modify the grid's scrolling behavior.
///
class SimpleGrid extends StatelessWidget {
  const SimpleGrid({
    super.key,
    required this.gridItems,
    this.crossAxisCount,
    this.itemHeight = 1,
    this.itemWidth = 1,
    this.title,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  /// The list of widgets to be displayed in the grid.
  final List<Widget> gridItems;

  /// The width ratio of each item in the grid.
  final double itemWidth;

  /// The height ratio of each item in the grid.
  final double itemHeight;

  /// The number of items in the cross axis of the grid.
  final int? crossAxisCount;

  /// An optional title to display above the grid.
  final String? title;

  /// The optional fixed height of the grid.
  final double? height;

  /// The scroll physics for the grid.
  ///
  /// This can be used to customize the scrolling behavior of the grid. By
  /// default, the grid is not scrollable.
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    var defaultCrossAxisCount;

    if (SimpleAppBreakpoints.isDesktop(context)) {
      defaultCrossAxisCount = 3;
    }
    if (SimpleAppBreakpoints.isTablet(context)) {
      defaultCrossAxisCount = 2;
    }
    if (SimpleAppBreakpoints.isMobile(context)) {
      defaultCrossAxisCount = 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(title != null)
            ? [
                SimpleText(
                  title!,
                  textStyle: SimpleTextStyle.headlineSmall,
                ),
                const SizedBox(height: SimpleConstants.sm)
              ]
            : [const SizedBox()],
        SizedBox(
          height: height,
          child: GridView.builder(
            shrinkWrap: true,
            physics: physics,
            padding: EdgeInsets.zero,
            itemCount: gridItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount ?? defaultCrossAxisCount,
              childAspectRatio: itemWidth / itemHeight,
              mainAxisSpacing: SimpleConstants.sm,
              crossAxisSpacing: SimpleConstants.sm,
            ),
            itemBuilder: (context, index) {
              return gridItems[index];
            },
          ),
        ),
      ],
    );
  }
}
