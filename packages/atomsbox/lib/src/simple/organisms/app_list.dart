import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

enum AppListType { horizontal, vertical }

class AppList extends StatelessWidget {
  final double? height;

  const AppList.vertical({
    super.key,
    this.title,
    this.description,
    required this.listItems,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  }) : type = AppListType.vertical;

  const AppList.horizontal({
    super.key,
    this.title,
    this.description,
    required this.listItems,
    this.height,
    this.physics,
  }) : type = AppListType.horizontal;

  final Widget? title;
  final Widget? description;
  final List<Widget> listItems;
  final ScrollPhysics? physics;
  final AppListType type;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final descriptionStyle = textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
                child: item);
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
      scrollDirection:
          type == AppListType.horizontal ? Axis.horizontal : Axis.vertical,
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
