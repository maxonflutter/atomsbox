import 'dart:ui';

import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

class SimpleImage extends StatelessWidget {
  SimpleImage(
    String imageUrl, {
    super.key,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadius = SimpleConstants.borderRadius,
    this.blurred = false,
    this.child,
  }) : image = Image.network(
          imageUrl,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder();
          },
        );

  SimpleImage.asset(
    String assetPath, {
    super.key,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadius = SimpleConstants.borderRadius,
    this.blurred = false,
    this.child,
  }) : image = Image.asset(
          assetPath,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder();
          },
        );

  final Image image;
  final BoxFit fit;
  final double? height;
  final double? width;
  final double borderRadius;
  final bool blurred;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: blurred
          ? ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: image,
            )
          : image,
    );
  }
}
