import 'package:flutter/material.dart';

import '../../../atomsbox.dart';

typedef CardBuilder = Card Function(BuildContext context, Color color);

enum SimpleCardType { elevated, filled, outlined }

class SimpleCard extends StatefulWidget {
  SimpleCard.elevated({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior = Clip.hardEdge,
    this.elevation = 4.0,
    this.width = 400,
    this.height = 150,
    required this.child,
  }) {
    builder = (context, color) {
      return Card(
        clipBehavior: Clip.hardEdge,
        margin: margin ?? EdgeInsets.zero,
        color: color,
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  SimpleCard.filled({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior = Clip.hardEdge,
    this.elevation = 0.0,
    this.width = 400,
    this.height = 150,
    required this.child,
  }) {
    builder = (context, color) {
      return Card(
        clipBehavior: Clip.hardEdge,
        margin: margin ?? EdgeInsets.zero,
        color: color,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  SimpleCard.outlined({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior = Clip.hardEdge,
    this.elevation,
    this.width = 400,
    this.height = 150,
    required this.child,
  }) {
    builder = (context, color) {
      return Card(
        clipBehavior: Clip.hardEdge,
        margin: margin ?? EdgeInsets.zero,
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
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
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  late bool hovered;

  @override
  void initState() {
    hovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = hovered
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.surface;

    Card card = widget.builder.call(context, color);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (event) => setState(() => hovered = true),
      onExit: (event) => setState(() => hovered = false),
      child: card,
    );
  }
}

final simpleCardThemeLight = CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
);

final simpleCardThemeDark = CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
);
