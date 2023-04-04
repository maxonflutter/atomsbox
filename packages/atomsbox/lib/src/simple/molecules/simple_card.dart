import 'package:flutter/material.dart';

import '../../../atomsbox.dart';

typedef CardBuilder = Card Function(BuildContext context);

enum SimpleCardType { elevated, filled, outlined }

class SimpleCard extends StatelessWidget {
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
    builder = (context) {
      return Card(
        clipBehavior: Clip.hardEdge,
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surface,
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          child:
              // Flexible(
              //   child:
              Container(
            constraints: BoxConstraints(maxHeight: height ?? 200),
            // height: 400,
            child: child,
          ),
        ),
        // ),
        // SizedBox(width: width, height: height, child: child)),
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
    builder = (context) {
      return Card(
        clipBehavior: Clip.hardEdge,
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surfaceVariant,
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
    builder = (context) {
      return Card(
        clipBehavior: Clip.hardEdge,
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surface,
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
  Widget build(BuildContext context) {
    Card card = builder.call(context);
    return card;
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
