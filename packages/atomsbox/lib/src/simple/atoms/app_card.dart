import 'dart:ui';

import 'package:atomsbox/src/simple/atoms/app_gradient.dart';
import 'package:flutter/material.dart';

import '../../../atomsbox.dart';
import 'app_glass.dart';

typedef CardBuilder = Card Function(BuildContext context);

enum AppCardType { elevated, filled, outlined }

class AppCard extends StatefulWidget {
  AppCard.elevated({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.shape,
    this.clipBehavior,
    this.elevation = 4.0,
    this.width,
    this.height,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surface,
        clipBehavior: clipBehavior ?? Theme.of(context).cardTheme.clipBehavior,
        shape: shape ?? Theme.of(context).cardTheme.shape,
        elevation: elevation,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  AppCard.filled({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior,
    this.shape,
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
        clipBehavior: clipBehavior ?? Theme.of(context).cardTheme.clipBehavior,
        shape: shape ?? Theme.of(context).cardTheme.shape,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  AppCard.outlined({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior,
    this.shape,
    this.elevation,
    this.width,
    this.height,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        shape: shape ??
            RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
        clipBehavior: clipBehavior ?? Theme.of(context).cardTheme.clipBehavior,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  AppCard.glass({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior,
    this.shape,
    this.elevation = 0.0,
    this.width,
    this.height,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation,
        color: Colors.transparent,
        clipBehavior: clipBehavior ?? Theme.of(context).cardTheme.clipBehavior,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
        child: InkWell(
          onTap: onTap,
          child: AppGlass(
            child: SizedBox(width: width, height: height, child: child),
          ),
        ),
      );
    };
  }
  AppCard.gradient({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.clipBehavior,
    this.shape,
    this.elevation = 0.0,
    this.width,
    this.height,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation,
        clipBehavior: clipBehavior ?? Theme.of(context).cardTheme.clipBehavior,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
        child: InkWell(
          onTap: onTap,
          child: AppGradient(
            child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              child: SizedBox(
                width: width,
                height: height,
                child: child,
              ),
            ),
          ),
        ),
      );
    };
  }

  late CardBuilder builder;
  final Function()? onTap;
  final Color? color;
  final EdgeInsets? margin;
  final Clip? clipBehavior;
  final ShapeBorder? shape;
  final double? elevation;
  final double? width;
  final double? height;
  final Widget child;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    Card card = widget.builder.call(context);
    return card;
  }
}

final appCardThemeLight = CardTheme(
  clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
);

final appCardThemeDark = CardTheme(
  clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
);
