import 'package:flutter/material.dart';

import '../../../atomsbox.dart';

typedef CardBuilder = Card Function(BuildContext context);

enum SimpleCardContainerType { elevated, filled, outlined }

class SimpleCardContainer extends StatefulWidget {
  SimpleCardContainer.elevated({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior = Clip.hardEdge,
    this.elevation = 4.0,
    this.width,
    this.height,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surface,
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  SimpleCardContainer.filled({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior = Clip.hardEdge,
    this.elevation = 0.0,
    this.width,
    this.height,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        elevation: 0.0,
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surface,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  SimpleCardContainer.outlined({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior = Clip.hardEdge,
    this.elevation,
    this.width,
    this.height,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  late CardBuilder builder;
  final Function()? onTap;
  final Color? color;
  final EdgeInsets? margin;
  final Clip clipBehavior;
  final double? elevation;
  final double? width;
  final double? height;
  final Widget child;

  @override
  State<SimpleCardContainer> createState() => _SimpleCardContainerState();
}

class _SimpleCardContainerState extends State<SimpleCardContainer> {
  @override
  Widget build(BuildContext context) {
    Card card = widget.builder.call(context);
    return card;
  }
}

final simpleCardContainerThemeLight = CardTheme(
  clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
);

final simpleCardContainerThemeDark = CardTheme(
  clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
);
