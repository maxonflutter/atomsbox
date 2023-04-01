// import 'dart:math';

// import 'package:flutter/material.dart';

// import '../atoms/config/simple_app_theme.dart';
// import '../atoms/config/simple_constants.dart';
// import '../atoms/config/simple_palettes.dart';
// import '../atoms/simple_image.dart';
// import '../atoms/simple_label.dart';
// import '../atoms/simple_text.dart';

// class SimpleCard extends StatelessWidget {
//   const SimpleCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     this.paragraph,
//     this.tagline,
//     this.labelText,
//     this.labelIcon,
//     this.width = double.infinity,
//     this.height = 400,
//     this.dense = true,
//     this.onTap,
//   });

//   final String imageUrl;

//   final String title;

//   final String? paragraph;

//   final String? tagline;

//   final String? labelText;

//   final IconData? labelIcon;

//   final double width;

//   final double height;

//   final bool dense;

//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     var _image;
//     var _title;
//     var _paragraph;
//     var _tagline;
//     var _chip;

//     _image = SimpleImage(
//       imageUrl: imageUrl,
//       width: width,
//       height: 150,
//     );

//     _title = SimpleText(
//       title,
//       maxLines: 2,
//       color: dense ? Theme.of(context).colorScheme.onPrimary : null,
//       textStyle: TextStyleEnum.headlineSmall,
//     );

//     if (tagline != null) {
//       _tagline = SimpleText(
//         tagline!,
//         color: dense ? Theme.of(context).colorScheme.onPrimary : null,
//         textStyle: TextStyleEnum.bodyMedium,
//       );
//     }

//     if (paragraph != null) {
//       _paragraph = SimpleText(
//         paragraph!,
//         maxLines: 3,
//         textStyle: TextStyleEnum.bodyMedium,
//       );
//     }

//     if (labelText != null && labelIcon != null) {
//       _chip = SimpleLabel(
//         text: labelText!,
//         icon: labelIcon!,
//         palette: Palette.primaryContainer,
//       );
//     }

//     return LayoutBuilder(builder: (context, constraints) {
//       return dense
//           ? _buildSimpleCardDense(
//               context,
//               constraints,
//               _image,
//               _tagline,
//               _title,
//               _chip,
//             )
//           : _buildSimpleCardExpanded(
//               context,
//               constraints,
//               _image,
//               _tagline,
//               _title,
//               _paragraph,
//             );
//     });
//   }

//   Container _buildSimpleCardExpanded(
//     context,
//     constraints,
//     _image,
//     _tagline,
//     _title,
//     _paragraph,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
//         color: Theme.of(context).colorScheme.surface,
//       ),
//       width: width,
//       child: Material(
//         borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
//         color: Theme.of(context).colorScheme.surface,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
//           onTap: onTap,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Flexible(child: _image),
//               Padding(
//                 padding: const EdgeInsets.all(SimpleConstants.md),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ...(tagline != null) ? [_tagline] : [const SizedBox()],
//                     _title,
//                     ...(paragraph != null) ? [_paragraph] : [const SizedBox()],
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   SizedBox _buildSimpleCardDense(
//     context,
//     constraints,
//     _image,
//     _tagline,
//     _title,
//     _chip,
//   ) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: Stack(
//         children: [
//           Positioned.fill(child: _image),
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   SimpleConstants.borderRadius,
//                 ),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.transparent,
//                     Theme.of(context).colorScheme.primary.withAlpha(150),
//                     Theme.of(context).colorScheme.primary,
//                   ],
//                   stops: const [0.2, 0.6, 1],
//                 ),
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 borderRadius:
//                     BorderRadius.circular(SimpleConstants.borderRadius),
//                 onTap: onTap,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: SimpleConstants.md,
//             left: SimpleConstants.md,
//             child: SizedBox(
//               width: min(width * 0.9, constraints.maxWidth * 0.9),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   (tagline != null) ? _tagline : const SizedBox(),
//                   _title,
//                 ],
//               ),
//             ),
//           ),
//           (labelText != null)
//               ? Positioned(
//                   left: SimpleConstants.md,
//                   top: SimpleConstants.md,
//                   child: _chip,
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
