import 'package:flutter/material.dart';

// A customizable image widget that handles network and asset images.
///
/// The [AppImage] widget extends the [Image] widget and provides constructors for
/// loading images from a network URL or an asset path. It also handles error cases
/// by displaying a [Placeholder] widget when the image fails to load.
///
/// See also:
///
/// * [Image], which is the base widget that [AppImage] extends.
class AppImage extends Image {
  /// Creates an [AppImage] that displays an image from a network URL.
  ///
  /// The [imageUrl] parameter must not be null.
  AppImage.network(
    String imageUrl, {
    super.key,
    super.fit = BoxFit.cover,
    super.height,
    super.width,
  }) : super.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) {
            // TODO: Replace with an asset image of a placeholder.
            return Placeholder();
          },
        );

  /// Creates an [AppImage] that displays an image from an asset path.
  ///
  /// The [assetPath] parameter must not be null.
  AppImage.asset(
    String assetPath, {
    super.key,
    super.fit = BoxFit.cover,
    super.height,
    super.width,
  }) : super.asset(
          assetPath,
          errorBuilder: (context, error, stackTrace) {
            // TODO: Replace with an asset image of a placeholder.
            return const Placeholder();
          },
        );
}
