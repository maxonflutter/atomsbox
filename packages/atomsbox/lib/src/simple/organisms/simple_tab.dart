import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_text.dart';

class SimpleTab extends StatefulWidget {
  const SimpleTab({
    super.key,
    required this.tabBarItemNames,
    required this.tabBarItemIcons,
    required this.tabBarViewChildren,
  }) : assert(
            tabBarItemNames.length == tabBarItemIcons.length &&
                tabBarItemNames.length == tabBarViewChildren.length,
            "The tabBarItemNames, tabBarItemIcons, tabBarViewChildren lists must have the same length.");

  final List<String> tabBarItemNames;
  final List<IconData> tabBarItemIcons;
  final List<Widget> tabBarViewChildren;

  @override
  State<SimpleTab> createState() => _SimpleTabState();
}

class _SimpleTabState extends State<SimpleTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            toolbarHeight: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                SimpleConstants.borderRadius,
              ),
            ),
            flexibleSpace: _SimpleTabBar(
              tabIndex: index,
              tabBarItems: widget.tabBarItemNames.map((name) {
                var _index = widget.tabBarItemNames.indexOf(name);
                var _count = widget.tabBarItemNames.length;
                return _SimpleTabBarItem(
                  index: _index,
                  isSelected: _index == index,
                  tabCount: _count,
                  text: name,
                  icon: widget.tabBarItemIcons[_index],
                  onTap: () => setState(() => index = _index),
                );
              }).toList(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(SimpleConstants.sm),
              child: widget.tabBarViewChildren[index],
            ),
          ),
        ],
      ),
    );
  }
}

class _SimpleTabBar extends StatelessWidget {
  const _SimpleTabBar({
    super.key,
    required this.tabIndex,
    required this.tabBarItems,
  });

  final int tabIndex;
  final List<_SimpleTabBarItem> tabBarItems;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Row(children: tabBarItems),
    );
  }
}

class _SimpleTabBarItem extends StatelessWidget {
  const _SimpleTabBarItem({
    super.key,
    required this.index,
    required this.tabCount,
    required this.text,
    required this.icon,
    this.onTap,
    this.isSelected = false,
  });

  final int index;
  final int tabCount;
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Color color;
    Color textColor;
    var borderRadius;

    if (isSelected) {
      color = Theme.of(context).colorScheme.primary;
      textColor = Theme.of(context).colorScheme.onPrimary;
      borderRadius = BorderRadius.circular(SimpleConstants.borderRadius);
    } else {
      color = Theme.of(context).colorScheme.surface;
      textColor = Theme.of(context).colorScheme.onSurface;

      if (index == 0) {
        borderRadius = const BorderRadius.only(
          bottomLeft: Radius.circular(SimpleConstants.borderRadius),
          topLeft: Radius.circular(SimpleConstants.borderRadius),
        );
      }
      if (index == tabCount - 1) {
        borderRadius = const BorderRadius.only(
          topRight: Radius.circular(SimpleConstants.borderRadius),
          bottomRight: Radius.circular(SimpleConstants.borderRadius),
        );
      }
    }
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(color: color, borderRadius: borderRadius),
          height: 50,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor,
                size: 20,
              ),
              const SizedBox(width: SimpleConstants.sm),
              SimpleText(
                text,
                textStyle: TextStyleEnum.bodyMedium,
                color: textColor,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
