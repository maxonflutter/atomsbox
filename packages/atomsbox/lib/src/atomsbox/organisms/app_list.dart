import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';
import '../molecules/app_text_block.dart';

enum AppListType { horizontal, vertical }

/// A widget displaying a list of items, either horizontally or vertically.
///
/// The [AppList] widget can display a list of items in a horizontal or vertical
/// layout, with an optional title and description. The list items are provided
/// through the [listItems] property, and the scroll direction is determined by
/// the constructor used: [AppList.horizontal] for a horizontal list or
/// [AppList.vertical] for a vertical list.
///
/// The [physics] argument is optional and can be used to customize the scroll
/// behavior of the list. The [height] argument is also optional and can be
/// used to set a fixed height for the list container.
///
/// See also:
///
/// * [ListView], which is used internally to create a vertical list.
/// * [SingleChildScrollView], which is used internally to create a horizontal list.
/// * [ScrollPhysics], which can be used to customize the scroll behavior of the list.
class AppList extends StatelessWidget {
  /// Creates a vertical AppList.
  ///
  /// The [listItems] parameter must not be null.
  const AppList.vertical({
    super.key,
    this.title,
    this.description,
    required this.listItems,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  }) : type = AppListType.vertical;

  /// Creates a horizontal AppList.
  ///
  /// The [listItems] parameter must not be null.
  const AppList.horizontal({
    super.key,
    this.title,
    this.description,
    required this.listItems,
    this.height,
    this.physics,
  }) : type = AppListType.horizontal;

  /// The optional title to display above the list.
  final Widget? title;

  /// The optional description to display below the title and above the list.
  final Widget? description;

  /// The fixed height for the list container, if provided.
  final double? height;

  /// The list items to display within the AppList.
  final List<Widget> listItems;

  /// The optional [ScrollPhysics] used to customize the scroll behavior of the list.
  final ScrollPhysics? physics;

  /// The [AppListType] determining the scroll direction of the list (horizontal or vertical).
  final AppListType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextBlock(title: title, subtitle: description),
        SizedBox(
          height: height,
          child: type == AppListType.horizontal
              ? _buildSingleChildScrollView()
              : _buildListView(),
        ),
      ],
    );
  }

  SingleChildScrollView _buildSingleChildScrollView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listItems.map((item) {
            return Container(
              margin: const EdgeInsets.only(right: AppConstants.sm),
              child: item,
            );
          }).toList(),
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: physics,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: AppConstants.sm),
          child: listItems[index],
        );
      },
    );
  }
}
