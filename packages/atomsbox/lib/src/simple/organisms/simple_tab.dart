import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_container.dart';

class SimpleTab extends StatefulWidget {
  const SimpleTab({
    super.key,
    required this.tabBarChildren,
    required this.tabBarViewChildren,
  }) : assert(tabBarChildren.length == tabBarViewChildren.length);

  final List<Tab> tabBarChildren;
  final List<Widget> tabBarViewChildren;

  @override
  State<SimpleTab> createState() => _SimpleTabState();
}

class _SimpleTabState extends State<SimpleTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabBarChildren.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleContainer(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SimpleTabBar(
            tabController: _tabController,
            tabBarChildren: widget.tabBarChildren,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                for (int i = 0; i < widget.tabBarViewChildren.length; i++)
                  widget.tabBarViewChildren[i],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleTabBarView extends StatelessWidget {
  const SimpleTabBarView({
    super.key,
    required this.tabController,
    required this.tabBarViewChildren,
  });

  final TabController tabController;
  final List<Widget> tabBarViewChildren;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          for (int i = 0; i < tabBarViewChildren.length; i++)
            tabBarViewChildren[i],
        ],
      ),
    );
  }
}

class SimpleTabBar extends StatelessWidget with PreferredSizeWidget {
  const SimpleTabBar({
    super.key,
    required this.tabController,
    required this.tabBarChildren,
    this.margin,
  });

  final TabController tabController;
  final List<Tab> tabBarChildren;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: EdgeInsets.symmetric(horizontal: margin ?? 0.0),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          color: Theme.of(context).colorScheme.secondary,
        ),
        indicatorColor: Theme.of(context).colorScheme.onPrimary,
        labelColor: Theme.of(context).colorScheme.onPrimary,
        unselectedLabelColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.38),
        tabs: tabBarChildren,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
