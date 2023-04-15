import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

/// A customizable app drawer widget.
///
/// The [AppDrawer] widget displays a drawer with a title and a list of drawer
/// items. It also supports an optional list of secondary drawer items.
///
/// See also:
///
/// * [Drawer], which is used internally to create the app drawer.
class AppDrawer extends StatelessWidget {
  /// Creates an app drawer widget.
  ///
  /// The [title] and [drawerItems] parameters must not be null.
  ///
  /// The [drawerSecondaryItems] parameter is optional and can be used to display
  /// secondary items in the drawer, separated by a divider.
  const AppDrawer({
    super.key,
    required this.title,
    required this.drawerItems,
    this.drawerSecondaryItems,
  });

  /// The title widget to display at the top of the app drawer.
  ///
  /// Must not be null.
  final Widget title;

  /// The list of drawer items to display in the app drawer.
  ///
  /// Must not be null.
  final List<Widget> drawerItems;

  /// The optional list of secondary drawer items to display in the app drawer.
  ///
  /// When provided, these items will be separated from the primary drawer items
  /// by a divider.
  final List<Widget>? drawerSecondaryItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
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
