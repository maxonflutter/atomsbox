import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

/// A simple widget to display an image loaded from a network URL with rounder corners
/// and an error callback if the image fails to load.
///
/// The [SimpleImage] widget provides a convenient way to display images loaded
/// from a network URL with customizable size and aspect ratio.
///
/// If the image fails to load, an error message will be printed to the console.
///
/// The widget uses a [Container] with a decoration that applies a border radius
/// and an [Image] widget with [NetworkImage] as its image source. Alternatively,
/// you can use the commented code to display the image using a [ClipRRect]
/// widget with a border radius.
///
/// See also:
/// * [Image], a lower-level widget for displaying images.
///
class SimpleImage extends StatelessWidget {
  const SimpleImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.child,
  });

  /// The URL of the image to be displayed.
  final String imageUrl;

  /// How to inscribe the image into the space allocated during layout.
  ///
  /// The default value is [BoxFit.cover], which scales and crops the image to
  /// fill the available space while maintaining its aspect ratio.
  final BoxFit fit;

  /// The height of the image.
  ///
  /// If not specified, the image height will be determined based on the aspect
  /// ratio of the image and the width of the widget.
  final double? height;

  /// The width of the image.
  ///
  /// If not specified, the image width will be determined based on the aspect
  /// ratio of the image and the height of the widget.
  final double? width;

  /// An optional child widget to display on top of the image.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            debugPrint('Error loading image: $exception');
          },
          image: NetworkImage(imageUrl),
        ),
      ),
      child: child,
    );
  }
}
