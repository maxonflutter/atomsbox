import 'package:atomsbox/src/simple/atoms/atoms.dart';
import 'package:flutter/material.dart';

class AppGradient extends StatelessWidget {
  const AppGradient({
    super.key,
    this.colors,
    required this.child,
  });

  final List<Color>? colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
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
