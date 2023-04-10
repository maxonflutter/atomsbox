import 'package:flutter/material.dart';

import 'config/app_constants.dart';

/// A widget that applies a gradient background to its child.
///
/// The [AppGradientBackground] widget creates a container with a rounded border
/// and a background gradient. The gradient colors can be provided, or they will
/// be derived from the current [Theme]'s color scheme.
///
/// ## Usage
///
/// To use the [AppGradientBackground] widget, simply wrap any other widget as its child.
///
/// dart /// AppGradientBackground( /// child: Text('Hello, World!'), /// ), /// ///
/// See also:
///
/// * [Container], which is used to create the gradient background.
/// * [Theme], which provides the colors used in the gradient.
class AppGradientBackground extends StatelessWidget {
  /// Creates an [AppGradientBackground] widget.
  ///
  /// The [child] parameter must not be null.
  /// The [colors] parameter is optional, and if not provided, will use the primary
  /// and secondary colors from the [Theme]'s color scheme.
  const AppGradientBackground({
    Key? key,
    this.colors,
    required this.child,
  }) : super(key: key);

  /// The colors to be used for the gradient background.
  ///
  /// If not provided, the primary and secondary colors from the [Theme]'s
  /// color scheme will be used.
  final List<Color>? colors;

  /// The widget below this widget in the tree.
  ///
  /// This widget will be wrapped with a container that has a gradient background.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppConstants.borderRadius,
        ),
        gradient: LinearGradient(
          colors: colors ??
              [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
        ),
      ),
      child: child,
    );
  }
}
