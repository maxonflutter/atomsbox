import 'dart:ui';

import 'package:flutter/material.dart';

import 'atoms.dart';

class AppGlass extends StatelessWidget {
  const AppGlass({
    super.key,
    this.colors,
    required this.child,
  });

  final List<Color>? colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: child,
      ),
    );
  }
}
