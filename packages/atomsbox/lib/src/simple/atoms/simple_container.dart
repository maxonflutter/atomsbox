import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

class SimpleContainer extends StatelessWidget {
  SimpleContainer({
    super.key,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    this.image,
    this.borderRadius = SimpleConstants.borderRadius,
    this.child,
  })  : constraints = BoxConstraints(),
        decoration = BoxDecoration(
          color: color,
          image: (image == null)
              ? null
              : DecorationImage(
                  image: image.image,
                  fit: BoxFit.cover,
                ),
          borderRadius: BorderRadius.circular(borderRadius),
        );

  SimpleContainer.gradient(
    LinearGradient gradient, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    this.image,
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
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Image? image;
  final BoxConstraints constraints;
  final BoxDecoration decoration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }
}
