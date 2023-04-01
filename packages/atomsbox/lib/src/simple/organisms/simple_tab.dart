import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_text.dart';

class SimpleTab extends StatefulWidget {
  const SimpleTab({
    super.key,
    required this.tabBarItemNames,
    required this.tabBarItemIcons,
    required this.tabBarViewChildren,
    this.brightness = Brightness.light,
    this.primary = true,
  }) : assert(
            tabBarItemNames.length == tabBarItemIcons.length &&
                tabBarItemNames.length == tabBarViewChildren.length,
            "The tabBarItemNames, tabBarItemIcons, tabBarViewChildren lists must have the same length.");

  final List<String> tabBarItemNames;

  final List<IconData> tabBarItemIcons;

  final List<Widget> tabBarViewChildren;

  final Brightness brightness;

  final bool primary;

  @override
  State<SimpleTab> createState() => _SimpleTabState();
}

class _SimpleTabState extends State<SimpleTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color selectedBackgroundColor;
    Color selectedTextColor;

    final colorScheme = Theme.of(context).colorScheme;

    if (widget.brightness == Brightness.light) {
      textColor = Colors.black87;
      selectedTextColor = Colors.white;

      selectedBackgroundColor =
          widget.primary ? colorScheme.primary : colorScheme.secondary;
      backgroundColor = Theme.of(context).colorScheme.surface;
    } else {
      textColor = Colors.black87;
      selectedTextColor = Colors.black87;

      selectedBackgroundColor = widget.primary
          ? colorScheme.primaryContainer
          : colorScheme.secondaryContainer;

      backgroundColor = Theme.of(context).colorScheme.background;
    }

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
              borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
            ),
            flexibleSpace: _SimpleTabBar(
              tabIndex: index,
              tabBarItems: widget.tabBarItemNames.map((name) {
                var tabIndex = widget.tabBarItemNames.indexOf(name);
                var tabCount = widget.tabBarItemNames.length;

                return _SimpleTabBarItem(
                  index: tabIndex,
                  isSelected: tabIndex == index,
                  tabCount: tabCount,
                  text: name,
                  textColor: textColor,
                  backgroundColor: backgroundColor,
                  selectedTextColor: selectedTextColor,
                  selectedBackgroundColor: selectedBackgroundColor,
                  icon: widget.tabBarItemIcons[tabIndex],
                  onTap: () => setState(() => index = tabIndex),
                );
              }).toList(),
            ),
          ),
          SliverToBoxAdapter(child: widget.tabBarViewChildren[index]),
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
    return Row(children: tabBarItems);
  }
}

class _SimpleTabBarItem extends StatelessWidget {
  const _SimpleTabBarItem({
    super.key,
    required this.index,
    required this.tabCount,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.selectedTextColor,
    required this.selectedBackgroundColor,
    required this.icon,
    this.onTap,
    this.isSelected = false,
  });

  final int index;
  final int tabCount;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color selectedTextColor;
  final Color selectedBackgroundColor;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var borderRadius;

    if (isSelected) {
      borderRadius = BorderRadius.circular(SimpleConstants.borderRadius);
    } else {
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
          decoration: BoxDecoration(
            color: isSelected ? selectedBackgroundColor : backgroundColor,
            borderRadius: borderRadius,
          ),
          height: 50,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? selectedTextColor : textColor,
                size: 20,
              ),
              const SizedBox(width: SimpleConstants.sm),
              SimpleText(
                text,
                color: isSelected ? selectedTextColor : textColor,
                textStyle: SimpleTextStyle.bodyMedium,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
