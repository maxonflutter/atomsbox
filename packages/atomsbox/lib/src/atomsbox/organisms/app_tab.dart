import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

/// A custom tab bar widget for displaying tabs with associated content.
///
/// The [AppTab] widget displays a group of tabs with corresponding content.
/// Each tab has an associated [Tab] widget and a [Widget] representing the
/// content of the tab. The length of [tabs] and [children] should be the same,
/// as each tab is linked to a corresponding child widget.
///
/// See also:
///
/// * [Tab], which represents a single tab in the [AppTab] widget.
/// * [TabController], which manages the state and animation of the tabs.
class AppTab extends StatefulWidget {
  /// Creates an [AppTab] widget with the provided [tabs] and [children].
  ///
  /// The [tabs] and [children] arguments must not be null, and their lengths
  /// must be the same.
  const AppTab({
    super.key,
    required this.tabs,
    required this.children,
  }) : assert(tabs.length == children.length);

  /// A list of [Tab] widgets representing each tab in the [AppTab] widget.
  final List<Tab> tabs;

  /// A list of [Widget]s representing the content for each tab in the [AppTab] widget.
  final List<Widget> children;

  @override
  State<AppTab> createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  late Widget currentChild;

  int currentTab = 0;

  @override
  void initState() {
    controller = TabController(length: widget.tabs.length, vsync: this);
    currentChild = widget.children[currentTab];

    controller.addListener(() {
      setState(() {
        currentTab = controller.index;
        currentChild = widget.children[currentTab];
      });
    });
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.children != oldWidget.children) {
      currentChild = widget.children[currentTab];
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _AppTabBar(
          controller: controller,
          children: widget.tabs,
        ),
        const SizedBox(height: AppConstants.sm),
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: currentChild,
        ),
      ],
    );
  }
}

/// A custom [TabBar] with preferred size and styling for the [AppTab] widget.
///
/// [_AppTabBar] is a private widget used internally by the [AppTab] widget.
/// It inherits from the [PreferredSizeWidget] mixin to provide a preferred size
/// for the tab bar.
class _AppTabBar extends StatelessWidget with PreferredSizeWidget {
  const _AppTabBar({
    super.key,
    required this.controller,
    required this.children,
  });

  /// The [TabController] managing the state and animation of the tabs.
  final TabController controller;

  /// A list of [Tab] widgets representing each tab in the [_AppTabBar] widget.
  final List<Tab> children;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        color: colorScheme.surface,
      ),
      child: TabBar(
        controller: controller,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          color: colorScheme.primary,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: colorScheme.onPrimary,
        unselectedLabelColor: colorScheme.onSurface,
        tabs: children,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
