import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

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

  final int currentIndex;
  final double height;
  final List<AppBottomNavBarItem> items;
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

class AppBottomNavBarItem {
  AppBottomNavBarItem({
    required this.icon,
    this.label,
    this.onTap,
  });

  final IconData icon;
  final String? label;
  final VoidCallback? onTap;
}
