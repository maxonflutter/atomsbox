import 'dart:ui';

import 'package:atomsbox/src/simple/atoms/app_gradient.dart';
import 'package:flutter/material.dart';

import '../../../atomsbox.dart';
import 'app_glass.dart';

typedef CardBuilder = Card Function(BuildContext context);

enum AppCardContainerType { elevated, filled, outlined }

class AppCardContainer extends StatefulWidget {
  AppCardContainer.elevated({
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

  AppCardContainer.filled({
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

  AppCardContainer.outlined({
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
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(width: width, height: height, child: child),
        ),
      );
    };
  }

  AppCardContainer.glass({
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
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
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
  AppCardContainer.gradient({
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
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation,
        shape: RoundedRectangleBorder(
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
  final Clip clipBehavior;
  final double? elevation;
  final double? width;
  final double? height;
  final Widget child;

  @override
  State<AppCardContainer> createState() => _AppCardContainerState();
}

class _AppCardContainerState extends State<AppCardContainer> {
  @override
  Widget build(BuildContext context) {
    Card card = widget.builder.call(context);
    return card;
  }
}

final appCardContainerThemeLight = CardTheme(
  clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
);

final appCardContainerThemeDark = CardTheme(
  clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
  ),
);
