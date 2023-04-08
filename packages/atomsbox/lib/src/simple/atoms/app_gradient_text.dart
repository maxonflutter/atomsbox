import 'package:flutter/material.dart';

import '../simple.dart';

class AppGradientText extends StatelessWidget {
  const AppGradientText({
    super.key,
    required this.child,
  });

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
