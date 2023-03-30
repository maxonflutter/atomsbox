import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_text.dart';

enum SimpleListType { horizontal, vertical }

/// A simple list widget that can display items either horizontally or vertically.
///
/// The [SimpleList] widget is a convenient way to create a scrollable list of
/// items with an optional title. This list can be either horizontal or
/// vertical, depending on the provided [type].
///
/// If a [height] is specified, the list will be constrained to that height,
/// and the items will be scrollable within that height. The [physics] property
/// can be used to customize the scrolling behavior of the list.
///
/// By default, the list is not scrollable. To make it scrollable, provide a
/// custom [ScrollPhysics] instance.
///
/// The [title] argument is optional. When provided, the title will be displayed
/// above the list.
///
/// See also:
/// * [ListView], which is a more flexible scrollable list of widgets.
///
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

  /// The scroll physics for the list.
  ///
  /// This can be used to customize the scrolling behavior of the list. By
  /// default, the list is not scrollable.
  final ScrollPhysics? physics;

  /// It defines whether the list is horizontal or
  /// vertical, depending on the provided [type].
  ///
  /// By default, the list has a vertical layout.
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
