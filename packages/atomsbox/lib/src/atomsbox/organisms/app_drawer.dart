import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';
import '../atoms/app_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.title,
    required this.drawerItems,
    this.drawerSecondaryItems,
  });

  final Widget title;
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
              SizedBox(
                height: 100,
                child: title,
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
