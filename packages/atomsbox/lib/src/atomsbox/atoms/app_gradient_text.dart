import 'package:flutter/material.dart';

import 'config/app_constants.dart';

/// A widget that applies a gradient effect to its child.
///
/// The [AppGradientText] widget uses a [ShaderMask] to apply a gradient effect
/// to its child. The gradient colors are derived from the current [Theme]'s
/// color scheme.
///
/// ## Usage
///
/// To use the [AppGradientText] widget, simply wrap any other widget as its child.
///
/// See also:
///
/// * [ShaderMask], which is used to apply the gradient effect.
/// * [Theme], which provides the colors used in the gradient.
class AppGradientText extends StatelessWidget {
  /// Creates an [AppGradientText] widget.
  ///
  /// The [child] parameter must not be null.
  const AppGradientText({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// This widget will have a gradient effect applied to it.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
      ]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.sm,
        ),
        child: child,
      ),
    );
  }
}
