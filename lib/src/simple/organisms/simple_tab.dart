import 'package:flutter/material.dart';

import '../atoms/simple_constants.dart';
import '../atoms/simple_text.dart';

/// A simple, customizable tab widget.
///
/// The [SimpleTab] widget allows users to navigate between multiple content
/// panels that are displayed one at a time. Each content panel corresponds to
/// a tab, and the active tab's index determines the content to be displayed.
///
/// Use the [SimpleTabBarItem] to define the tabs, and [_SimpleTabBarView] to
/// define the content of each tab.
///
/// See also:
/// * [SimpleTabBarItem], which represents an individual tab item.
/// * [_SimpleTabBar], which displays the tabs and manages their selection.
/// * [_SimpleTabBarView], which displays the content corresponding to the
/// selected tab.
///
class SimpleTab extends StatefulWidget {
  const SimpleTab({super.key});

  @override
  State<SimpleTab> createState() => _SimpleTabState();
}

class _SimpleTabState extends State<SimpleTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: SimpleConstants.md),
            _SimpleTabBar(
              tabIndex: index,
              tabBarItems: [
                SimpleTabBarItem(
                  index: 0,
                  isSelected: 0 == index,
                  tabCount: 3,
                  text: 'Tab 1',
                  icon: Icons.code,
                  onTap: () => setState(() => index = 0),
                ),
                SimpleTabBarItem(
                  index: 1,
                  isSelected: 1 == index,
                  tabCount: 3,
                  text: 'Tab 2',
                  icon: Icons.people,
                  onTap: () => setState(() => index = 1),
                ),
                SimpleTabBarItem(
                  index: 2,
                  isSelected: 2 == index,
                  tabCount: 3,
                  text: 'Tab 3',
                  icon: Icons.people,
                  onTap: () => setState(() => index = 2),
                ),
              ],
            ),
            const SizedBox(height: SimpleConstants.md),
            _SimpleTabBarView(
              index: index,
              tabBarViewItems: [
                Column(
                  children: [
                    Container(
                      height: 400,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: const Center(child: SimpleText('Tab #1')),
                    ),
                    const SizedBox(height: SimpleConstants.md),
                    Container(
                      height: 400,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: const Center(child: SimpleText('Tab #1')),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 400,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: const Center(child: SimpleText('Tab #2')),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 400,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: const Center(child: SimpleText('Tab #3')),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
  final List<SimpleTabBarItem> tabBarItems;

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

class SimpleTabBarItem extends StatelessWidget {
  const SimpleTabBarItem({
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

class _SimpleTabBarView extends StatelessWidget {
  const _SimpleTabBarView({
    super.key,
    required this.index,
    required this.tabBarViewItems,
  });

  final int index;
  final List<Widget> tabBarViewItems;

  @override
  Widget build(BuildContext context) {
    return tabBarViewItems[index];
  }
}
