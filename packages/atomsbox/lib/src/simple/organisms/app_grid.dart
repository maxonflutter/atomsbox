import 'package:flutter/material.dart';

import '../atoms/config/app_breakpoints.dart';
import '../atoms/config/app_constants.dart';

class AppGrid extends StatelessWidget {
  const AppGrid({
    super.key,
    this.title,
    this.description,
    required this.gridItems,
    this.crossAxisCount,
    this.childAspectRatio = 1.0,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  final Widget? title;
  final Widget? description;
  final List<Widget> gridItems;
  final double childAspectRatio;
  final int? crossAxisCount;
  final double? height;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final descriptionStyle = textTheme.bodyMedium;

    var defaultCrossAxisCount;

    if (AppBreakpoints.isDesktop(context)) {
      defaultCrossAxisCount = 3;
    }
    if (AppBreakpoints.isTablet(context)) {
      defaultCrossAxisCount = 2;
    }
    if (AppBreakpoints.isMobile(context)) {
      defaultCrossAxisCount = 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title != null)
            ? DefaultTextStyle(
                style: titleStyle!,
                child: title!,
              )
            : const SizedBox(),
        ...(description != null)
            ? [
                DefaultTextStyle(
                  style: descriptionStyle!,
                  child: description!,
                ),
                const SizedBox(height: AppConstants.sm),
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
              childAspectRatio: childAspectRatio,
              mainAxisSpacing: AppConstants.sm,
              crossAxisSpacing: AppConstants.sm,
            ),
            itemBuilder: (context, index) => gridItems[index],
          ),
        ),
      ],
    );
  }
}
