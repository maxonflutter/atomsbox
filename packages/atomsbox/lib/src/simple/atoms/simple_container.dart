import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

class SimpleContainer extends StatelessWidget {
  SimpleContainer({
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderRadius = SimpleConstants.borderRadius,
    this.child,
  })  : constraints = BoxConstraints(),
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        );

  SimpleContainer.gradient(
    LinearGradient gradient, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderRadius = SimpleConstants.borderRadius,
    this.child,
  })  : constraints = BoxConstraints(),
        decoration = BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        );

  final double? width;
  final double? height;
  final double borderRadius;
  final Color? color;
  final BoxConstraints constraints;
  final BoxDecoration decoration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: child,
    );
  }
}
