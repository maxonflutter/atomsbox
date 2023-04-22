import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'app_gradient_background.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

enum AppCardType { elevated, filled, outlined }

/// A versatile card widget with multiple styles.
///
/// The [AppCard] widget displays a card with one of the following styles:
/// - elevated
/// - filled
/// - outlined
/// - glass
/// - gradient
///
/// Each style has its own constructor, and some properties can be customized.
/// The card can react to touch events when an [onTap] callback is provided.
///
/// Use the following constructors to create the respective card styles:
/// - [AppCard.elevated]
/// - [AppCard.filled]
/// - [AppCard.outlined]
/// - [AppCard.glass]
/// - [AppCard.gradient]
///
/// ## Customization
///
/// The appearance of the card can be customized using the following properties:
/// - [color] for the card's background color
/// - [surfaceTintcolor] for the overlay on color to indicate elevation.
/// - [margin] for the card's margin
/// - [clipBehavior] for the card's clip behavior
/// - [shape] for the card's shape
/// - [elevation] for the card's elevation
/// - [width] for the card's width
/// - [height] for the card's height
/// - [child] for the card's content
///
/// See also:
///
/// * [Card], the base Flutter card widget.
/// * [InkWell], which is used for handling tap events.

// ignore: must_be_immutable
class AppCard extends StatelessWidget {
  /// Creates an elevated card with the given properties.
  ///
  /// If the [color] argument is null, the card will use the color from the
  /// closest enclosing [Theme].
  ///
  /// The [elevation] defaults to 4.0.
  AppCard.elevated({
    super.key,
    this.onTap,
    this.color,
    this.surfaceTintColor,
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
        surfaceTintColor:
            surfaceTintColor ?? Theme.of(context).colorScheme.surfaceTint,
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

  /// Creates a filled card with the given properties.
  ///
  /// If the [color] argument is null, the card will use the color from the
  /// closest enclosing [Theme].
  ///
  /// The [elevation] defaults to 0.0.
  AppCard.filled({
    super.key,
    this.onTap,
    this.color,
    this.surfaceTintColor,
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

  /// Creates an outlined card with the given properties.
  ///
  /// If the [color] argument is null, the card will use the color from the
  /// closest enclosing [Theme].
  AppCard.outlined({
    super.key,
    this.onTap,
    this.color,
    this.surfaceTintColor,
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

  /// Creates a glass card with the given properties.
  ///
  /// The [color] argument is ignored since this card style uses a transparent
  /// background.
  ///
  /// The [elevation] defaults to 0.0.
  AppCard.glass({
    super.key,
    this.onTap,
    this.color,
    this.surfaceTintColor,
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

  /// Creates a gradient card with the given properties.
  ///
  /// The [color] argument is ignored since this card style
  /// uses a gradient
  AppCard.gradient({
    super.key,
    this.onTap,
    this.color,
    this.surfaceTintColor,
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
          child: AppGradientBackground(
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

  /// Internal builder for creating a [Card] with the specified style.
  late CardBuilder builder;
  final Function()? onTap;
  final Color? color;
  final Color? surfaceTintColor;
  final EdgeInsets? margin;
  final Clip? clipBehavior;
  final ShapeBorder? shape;
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
