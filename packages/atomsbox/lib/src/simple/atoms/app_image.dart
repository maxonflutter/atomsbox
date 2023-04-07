import 'package:flutter/material.dart';

class AppImage extends Image {
  AppImage.network(
    String imageUrl, {
    super.key,
    super.fit = BoxFit.cover,
    super.height,
    super.width,
  }) : super.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder();
          },
        );

  AppImage.asset(
    String assetPath, {
    super.key,
    super.fit = BoxFit.cover,
    super.height,
    super.width,
  }) : super.asset(
          assetPath,
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder();
          },
        );
}
