import 'package:flutter/material.dart';

import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';

/// A custom bottom navigation bar widget.
///
/// The [AppBottomNavBar] is a custom widget that displays a bottom navigation
/// bar with a specified list of items. It supports different styles, like
/// floating or fixed, and allows you to customize its appearance.
///
/// The navigation bar requires at least two items and can contain a maximum
/// of five items.
///
/// See also:
///
/// * [AppBottomNavBarItem], which represents a single item in the bottom
/// navigation bar.
class AppBottomNavBar extends StatefulWidget {
  AppBottomNavBar({
    Key? key,
    this.currentIndex = 0,
    required this.items,
    this.height = 56.0,
    this.floating = false,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        super(key: key);

  /// The index of the currently active item.
  ///
  /// Defaults to 0.
  final int currentIndex;

  /// The height of the bottom navigation bar.
  ///
  /// Defaults to 56.0.
  final double height;

  /// The list of items to be displayed in the bottom navigation bar.
  ///
  /// Must contain at least two items and at most five items.
  final List<AppBottomNavBarItem> items;

  /// Determines if the bottom navigation bar should be floating.
  ///
  /// Defaults to false.
  final bool floating;

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _items = widget.items
        .asMap()
        .map((index, item) {
          return MapEntry(
            index,
            LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                width: constraints.maxWidth.isFinite
                    ? (constraints.maxWidth - AppConstants.lg) /
                        widget.items.length
                    : (size.width - AppConstants.lg) / widget.items.length,
                child: _buildAppBottomNavBarItem(context, index, item),
              ),
            ),
          );
        })
        .values
        .toList();

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: widget.floating
          ? Container(
              margin: EdgeInsets.only(
                left: AppConstants.sm,
                right: AppConstants.sm,
                bottom: MediaQuery.of(context).viewPadding.bottom,
              ),
              height: widget.height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(AppConstants.sm),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(AppConstants.sm),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _items,
                ),
              ),
            )
          : BottomAppBar(
              padding: EdgeInsets.zero,
              height: widget.height + MediaQuery.of(context).viewPadding.bottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _items,
              ),
            ),
    );
  }

  InkWell _buildAppBottomNavBarItem(
    BuildContext context,
    int index,
    AppBottomNavBarItem item,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      onTap: item.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            color: _currentIndex == index
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withAlpha(100),
          ),
          if (item.label != null)
            AppText.bodySmall(
              '${item.label}',
              color: _currentIndex == index
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withAlpha(100),
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}

/// A single item in the [AppBottomNavBar] widget.
///
/// Represents a navigation item in the custom bottom navigation bar. It
/// contains an [icon] and an optional [label] and [onTap] callback.
class AppBottomNavBarItem {
  AppBottomNavBarItem({
    required this.icon,
    this.label,
    this.onTap,
  });

  /// The icon to be displayed in the navigation item.
  final IconData icon;

  /// The optional text label for the navigation item.
  final String? label;

  /// The optional callback to be executed when the navigation item is tapped.
  final VoidCallback? onTap;
}
