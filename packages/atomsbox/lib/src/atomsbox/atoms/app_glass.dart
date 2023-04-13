import 'dart:ui';

import 'package:flutter/material.dart';

import 'config/app_constants.dart';

/// A widget that applies a frosted glass effect to its child.
///
/// The [AppGlass] widget clips its child to a rounded rectangle and applies a
/// frosted glass effect using a [BackdropFilter]. The frosted glass effect is
/// achieved by applying a Gaussian blur with a customizable sigma value.
///
/// ## Usage
///
/// To use the [AppGlass] widget, simply wrap any other widget as its child.
///
/// See also:
///
/// * [ClipRRect], which is used to clip the child to a rounded rectangle.
/// * [BackdropFilter], which is used to apply the frosted glass effect.
class AppGlass extends StatelessWidget {
  /// Creates an [AppGlass] widget.
  ///
  /// The [child] parameter must not be null.
  const AppGlass({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// This widget will be clipped to a rounded rectangle and have a frosted
  /// glass effect applied to it.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: child,
      ),
    );
  }
}
