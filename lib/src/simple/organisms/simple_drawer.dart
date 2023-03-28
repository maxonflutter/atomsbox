import 'package:flutter/material.dart';

import '../atoms/simple_constants.dart';
import '../atoms/simple_text.dart';

/// A simple drawer widget that displays a list of primary and secondary items.
///
/// The [SimpleDrawer] widget is a pre-styled drawer that displays a list of
/// primary and secondary items, separated by a divider. The drawer items are
/// provided as lists of widgets.
///
/// The [drawerItems] argument is required and contains the primary items to
/// display in the drawer. The [drawerSecondaryItems] argument is optional and
/// contains the secondary items to display in the drawer, separated by a divider.
///
/// See also:
///
/// * [Drawer], which is the underlying widget used to create the drawer.
///
class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({
    super.key,
    required this.drawerItems,
    this.drawerSecondaryItems,
  });

  /// The primary items to display in the drawer.
  ///
  /// This list of widgets will be displayed at the top of the drawer.
  final List<Widget> drawerItems;

  /// The secondary items to display in the drawer.
  ///
  /// This list of widgets, if provided, will be displayed at the bottom of the
  /// drawer, separated by a divider. If this list is not provided or is null,
  /// no divider or secondary items will be displayed.
  final List<Widget>? drawerSecondaryItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
                child: SimpleText(
                  SimpleConstants.appName,
                  textStyle: TextStyleEnum.headlineMedium,
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [...drawerItems],
                ),
              ),
              ...(drawerSecondaryItems != null)
                  ? [
                      const Spacer(),
                      const Divider(),
                      ...drawerSecondaryItems!,
                    ]
                  : [const SizedBox()],
            ],
          ),
        ),
      ),
    );
  }
}
