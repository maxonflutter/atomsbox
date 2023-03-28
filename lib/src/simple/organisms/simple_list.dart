import 'package:flutter/material.dart';

import '../atoms/simple_constants.dart';
import '../atoms/simple_text.dart';

enum SimpleListType { horizontal, vertical }

/// A simple list of items with an optional title.
///
/// The [SimpleList] widget displays a list of items with an optional title at
/// the top. The items are separated by dividers to visually separate the content.
///
/// The [listItems] argument is required and contains the list of widgets that
/// will be displayed as items in the list. The [title] argument is optional,
/// and when provided, will be displayed at the top of the list.
///
/// ## Layout
///
/// The [SimpleList] uses a [Column] widget to lay out the title and the list
/// of items. The list of items is displayed using a [ListView.separated] widget,
/// which adds dividers between the items.
///
/// The [title] is displayed using a [SimpleText] widget with a small headline
/// style. If the [title] is not provided, an empty [SizedBox] is used instead.
///
/// ## Scrolling
///
/// The [SimpleList] widget has disabled scrolling by default. To enable
/// scrolling, wrap the widget in a scrollable parent, like [SingleChildScrollView].
///
/// See also:
///
/// * [ListView], which is a scrollable list of widgets arranged linearly.
class SimpleList extends StatelessWidget {
  final double? height;

  const SimpleList({
    super.key,
    required this.listItems,
    this.title,
    this.height,
    this.physics = const NeverScrollableScrollPhysics(),
    this.type = SimpleListType.vertical,
  });

  const SimpleList.horizontal({
    super.key,
    required this.listItems,
    required this.height,
    this.title,
    this.physics,
  }) : type = SimpleListType.horizontal;

  /// The list of items to display in the list.
  ///
  /// This argument must not be null.
  final List<Widget> listItems;

  /// The optional title to display at the top of the list.
  ///
  /// If this is null, no title will be displayed.
  final String? title;

  final ScrollPhysics? physics;

  final SimpleListType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(title != null)
            ? [
                SimpleText(
                  title!,
                  textStyle: TextStyleEnum.headlineSmall,
                ),
                const SizedBox(height: 8.0)
              ]
            : [const SizedBox()],
        SizedBox(
          height: height,
          child: ListView.separated(
            shrinkWrap: true,
            physics: physics,
            scrollDirection: type == SimpleListType.horizontal
                ? Axis.horizontal
                : Axis.vertical,
            itemCount: listItems.length,
            separatorBuilder: (context, index) {
              return Divider(
                indent: SimpleConstants.sm,
                // endIndent: SimpleConstants.md,
                color: Theme.of(context).colorScheme.onBackground.withAlpha(50),
              );
            },
            itemBuilder: (context, index) {
              return listItems[index];
            },
          ),
        ),
      ],
    );
  }
}
