import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_text.dart';

/// A simple tab bar widget with customizable tab items.
///
/// The [SimpleTab] widget displays a tab bar with customizable tab items and
/// their corresponding content. The tab bar items are defined using a list of
/// [tabBarItemNames], [tabBarItemIcons], and [tabBarViewChildren], where each
/// index represents a tab item and its related content.
///
/// Each tab item will display an icon and a text label. When a tab is selected,
/// the content associated with that tab will be displayed.
///
/// ## Usage
/// To use [SimpleTab], simply provide the required parameters [tabBarItemNames],
/// [tabBarItemIcons], and [tabBarViewChildren], ensuring that each list has the
/// same length.
///
/// See also:
/// * [TabBar], which is a Material Design implementation of a tab bar.
/// * [TabBarView], which displays the content associated with a Material Design [TabBar].
///
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

  /// A list of strings representing the text labels for each tab item.
  final List<String> tabBarItemNames;

  /// A list of [IconData] representing the icons for each tab item.
  final List<IconData> tabBarItemIcons;

  /// A list of [Widget]s representing the content for each tab item.
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
          SliverToBoxAdapter(child: widget.tabBarViewChildren[index]),
        ],
      ),
    );
  }
}

/// A simple custom tab bar widget.
///
/// The [_SimpleTabBar] widget is a custom tab bar implementation that displays
/// a row of [_SimpleTabBarItem] widgets. It requires a [tabIndex] to indicate
/// the currently selected tab and a list of [tabBarItems] to be displayed.
///
/// The [_SimpleTabBar] widget animates the background color of the selected tab
/// and updates the selected state of the [_SimpleTabBarItem] widgets based on
/// the [tabIndex] provided. The appearance of the tab bar follows the current
/// theme's color scheme.
///
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

/// A simple tab bar item widget.
///
/// The [_SimpleTabBarItem] widget is a custom tab bar item that displays an
/// icon and a text label within a container. The item can be in a selected or
/// unselected state, which is controlled by the [isSelected] property.
///
/// The widget is designed to be used as a part of a custom tab bar implementation.
/// It requires the [index], [tabCount], [text], and [icon] properties to be
/// provided. The [onTap] callback is optional and can be used to handle tap
/// events on the tab bar item.
///
/// The appearance of the widget changes based on the selected state. When
/// selected, the background color of the container is set to the primary color
/// of the current theme, and the text and icon colors are set to the onPrimary
/// color. When unselected, the background color of the container is set to the
/// surface color of the current theme, and the text and icon colors are set to
/// the onSurface color.
///
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
