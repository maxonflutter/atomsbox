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
    this.title,
    this.description,
    required this.gridItems,
    this.crossAxisCount,
    this.itemHeight = 1,
    this.itemWidth = 1,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  final Widget? title;
  final Widget? description;
  final List<Widget> gridItems;
  final double itemWidth;
  final double itemHeight;
  final int? crossAxisCount;
  final double? height;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final descriptionStyle = textTheme.bodyMedium;

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
                DefaultTextStyle(
                  style: titleStyle!,
                  child: title!,
                ),
                const SizedBox(height: SimpleConstants.sm),
              ]
            : [const SizedBox()],
        ...(description != null)
            ? [
                DefaultTextStyle(
                  style: descriptionStyle!,
                  child: description!,
                ),
                const SizedBox(height: SimpleConstants.sm),
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
