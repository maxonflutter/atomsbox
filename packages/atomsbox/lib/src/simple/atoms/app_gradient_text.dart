import 'package:flutter/material.dart';

import '../simple.dart';

/// A widget that applies a gradient to the text of a child widget.
///
/// The [AppGradientText] widget takes a [child] widget and applies a
/// gradient effect to its text. The gradient effect is created using the
/// primary and secondary colors of the current [Theme].
///
/// See also:
///
///  * [Text], which displays a run of text with a single style.
///  * [ShaderMask], which applies a shader to its child.
class AppGradientText extends StatelessWidget {
  const AppGradientText({
    super.key,
    required this.child,
  });

  /// The child widget containing the text to which the gradient effect will be applied.
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
        padding: const EdgeInsets.all(AppConstants.sm),
        child: child,
      ),
    );
  }
}
