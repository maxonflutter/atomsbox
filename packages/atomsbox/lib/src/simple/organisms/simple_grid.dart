import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';

/// A simple grid layout for displaying a list of widgets.
///
/// The [SimpleGrid] widget creates a grid layout with a specified number of
/// columns, using a list of widgets as its children. The grid can have a
/// custom item width and height, which are used to determine the aspect ratio
/// of each grid item.
///
/// This widget uses a [GridView.builder] to build its layout and
/// uses the [NeverScrollableScrollPhysics] for its scrolling behavior.
///
/// See also:
/// * [GridView], which provides more control over the grid layout.
/// * [SliverGridDelegateWithFixedCrossAxisCount], which creates a grid layout
/// with a fixed number of tiles in the cross axis.
///
class SimpleGrid extends StatelessWidget {
  const SimpleGrid({
    super.key,
    required this.gridItems,
    this.crossAxisCount = 2,
    this.itemHeight = 1,
    this.itemWidth = 1,
  });

  /// The list of widgets to be displayed in the grid.
  final List<Widget> gridItems;

  /// The width of each grid item.
  final double itemWidth;

  /// The height of each grid item.
  final double itemHeight;

  /// The number of columns in the grid.
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: gridItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: itemWidth / itemHeight,
        mainAxisSpacing: SimpleConstants.md,
        crossAxisSpacing: SimpleConstants.md,
      ),
      itemBuilder: (context, index) {
        return gridItems[index];
      },
    );
  }
}
