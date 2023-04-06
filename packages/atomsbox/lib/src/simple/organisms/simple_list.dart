import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';

enum SimpleListType { horizontal, vertical }

class SimpleList extends StatelessWidget {
  final double? height;

  const SimpleList.vertical({
    super.key,
    this.title,
    this.description,
    required this.listItems,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
  }) : type = SimpleListType.vertical;

  const SimpleList.horizontal({
    super.key,
    this.title,
    this.description,
    required this.listItems,
    required this.height,
    this.physics,
  }) : type = SimpleListType.horizontal;

  final Widget? title;
  final Widget? description;
  final List<Widget> listItems;
  final ScrollPhysics? physics;
  final SimpleListType type;

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
          child: ListView.builder(
            shrinkWrap: true,
            physics: physics,
            padding: EdgeInsets.zero,
            scrollDirection: type == SimpleListType.horizontal
                ? Axis.horizontal
                : Axis.vertical,
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  right: type == SimpleListType.horizontal
                      ? SimpleConstants.sm
                      : 0.0,
                  bottom: type == SimpleListType.vertical
                      ? SimpleConstants.sm
                      : 0.0,
                ),
                child: listItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
