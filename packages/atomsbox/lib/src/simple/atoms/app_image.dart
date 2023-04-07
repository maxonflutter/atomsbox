import 'dart:ui';

import 'package:atomsbox/src/simple/atoms/config/app_typedef.dart';
import 'package:flutter/material.dart';

import 'config/app_constants.dart';

class AppImage extends Image {
  AppImage.network(
    String imageUrl, {
    super.key,
    this.fit = BoxFit.cover,
    this.height,
    this.width = double.infinity,
    this.borderRadius = AppConstants.borderRadius,
    this.blurred = false,
    this.child,
  }) : super.network(
          imageUrl,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder();
          },
        );

  AppImage.asset(
    String assetPath, {
    super.key,
    this.fit = BoxFit.cover,
    this.height,
    this.width = double.infinity,
    this.borderRadius = AppConstants.borderRadius,
    this.blurred = false,
    this.child,
  }) : super.asset(
          assetPath,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder();
          },
        );

  late ImageBuilder? builder;
  final BoxFit fit;
  final double? height;
  final double? width;
  final double borderRadius;
  final bool blurred;
  final Widget? child;
}

// class AppImage extends StatelessWidget {
//   AppImage(
//     String imageUrl, {
//     super.key,
//     this.fit = BoxFit.cover,
//     this.height,
//     this.width = double.infinity,
//     this.borderRadius = AppConstants.borderRadius,
//     this.blurred = false,
//     this.child,
//   }) : image = Image.network(
//           imageUrl,
//           height: height,
//           width: width,
//           fit: fit,
//           errorBuilder: (context, error, stackTrace) {
//             return const Placeholder();
//           },
//         );

//   AppImage.asset(
//     String assetPath, {
//     super.key,
//     this.fit = BoxFit.cover,
//     this.height,
//     this.width = double.infinity,
//     this.borderRadius = AppConstants.borderRadius,
//     this.blurred = false,
//     this.child,
//   }) : image = Image.asset(
//           assetPath,
//           height: height,
//           width: width,
//           fit: fit,
//           errorBuilder: (context, error, stackTrace) {
//             return const Placeholder();
//           },
//         );

//   final Image image;
//   final BoxFit fit;
//   final double? height;
//   final double? width;
//   final double borderRadius;
//   final bool blurred;
//   final Widget? child;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius),
//       child: blurred
//           ? ImageFiltered(
//               imageFilter: ImageFilter.blur(
//                 sigmaX: 5,
//                 sigmaY: 5,
//               ),
//               child: image,
//             )
//           : image,
//     );
//   }
// }


// // class AppImage extends StatelessWidget {
// //   AppImage(
// //     String imageUrl, {
// //     super.key,
// //     this.fit = BoxFit.cover,
// //     this.height,
// //     this.width = double.infinity,
// //     this.borderRadius = AppConstants.borderRadius,
// //     this.blurred = false,
// //     this.child,
// //   }) : image = Image.network(
// //           imageUrl,
// //           height: height,
// //           width: width,
// //           fit: fit,
// //           errorBuilder: (context, error, stackTrace) {
// //             return const Placeholder();
// //           },
// //         );

// //   AppImage.asset(
// //     String assetPath, {
// //     super.key,
// //     this.fit = BoxFit.cover,
// //     this.height,
// //     this.width = double.infinity,
// //     this.borderRadius = AppConstants.borderRadius,
// //     this.blurred = false,
// //     this.child,
// //   }) : image = Image.asset(
// //           assetPath,
// //           height: height,
// //           width: width,
// //           fit: fit,
// //           errorBuilder: (context, error, stackTrace) {
// //             return const Placeholder();
// //           },
// //         );

// //   final Image image;
// //   final BoxFit fit;
// //   final double? height;
// //   final double? width;
// //   final double borderRadius;
// //   final bool blurred;
// //   final Widget? child;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ClipRRect(
// //       borderRadius: BorderRadius.circular(borderRadius),
// //       child: blurred
// //           ? ImageFiltered(
// //               imageFilter: ImageFilter.blur(
// //                 sigmaX: 5,
// //                 sigmaY: 5,
// //               ),
// //               child: image,
// //             )
// //           : image,
// //     );
// //   }
// // }
