import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

class AppTab extends StatefulWidget {
  const AppTab({
    super.key,
    required this.tabs,
    required this.children,
  }) : assert(tabs.length == children.length);

  final List<Tab> tabs;
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

class _AppTabBar extends StatelessWidget with PreferredSizeWidget {
  const _AppTabBar({
    super.key,
    required this.controller,
    required this.children,
  });

  final TabController controller;
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
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          color: colorScheme.primary,
        ),
        labelColor: colorScheme.onPrimary,
        unselectedLabelColor: colorScheme.onSurface,
        tabs: children,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
