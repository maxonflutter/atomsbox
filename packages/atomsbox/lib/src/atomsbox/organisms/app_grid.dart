import 'package:flutter/material.dart';

import '../atoms/config/app_breakpoints.dart';
import '../atoms/config/app_constants.dart';

class AppGrid extends StatelessWidget {
  const AppGrid({
    super.key,
    this.title,
    this.description,
    required this.gridItems,
    required this.gridSettings,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  final Widget? title;
  final Widget? description;
  final double? height;
  final ScrollPhysics? physics;
  final AppGridSettings gridSettings;
  final List<Widget> gridItems;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final descriptionStyle = textTheme.bodyMedium;

    SliverGridDelegateWithFixedCrossAxisCount gridDelegate;

    if (AppBreakpoints.isDesktop(context)) {
      gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridSettings.desktopCrossAxisCount,
        mainAxisSpacing: gridSettings.desktopMainAxisSpacing,
        crossAxisSpacing: gridSettings.desktopCrossAxisSpacing,
        childAspectRatio: gridSettings.desktopChildAspectRatio,
      );
    }
    if (AppBreakpoints.isTablet(context)) {
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
        if (title != null)
          DefaultTextStyle(
            style: titleStyle!,
            child: title!,
          ),
        if (description != null)
          DefaultTextStyle(
            style: descriptionStyle!,
            child: description!,
          ),
        if (title != null || description != null)
          const SizedBox(height: AppConstants.sm),
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
