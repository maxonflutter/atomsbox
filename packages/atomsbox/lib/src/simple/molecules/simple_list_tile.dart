// import 'package:flutter/material.dart';

// import '../atoms/config/simple_app_theme.dart';
// import '../atoms/config/simple_constants.dart';
// import '../atoms/config/simple_palettes.dart';
// import '../atoms/simple_text.dart';

// class SimpleListTile extends StatelessWidget {
//   const SimpleListTile({
//     super.key,
//     required this.title,
//     this.subtitle,
//     this.tagline,
//     this.leading,
//     this.trailing,
//     this.width,
//     this.onTap,
//     this.palette = Palette.primaryContainer,
//   });

//   final String title;

//   final String? subtitle;

//   final String? tagline;

//   final Widget? leading;

//   final Widget? trailing;

//   final double? width;

//   final VoidCallback? onTap;

//   final Palette palette;

//   @override
//   Widget build(BuildContext context) {
//     final colors = getPalette(context, palette, true);
//     final textColor =
//         ThemeData.estimateBrightnessForColor(colors['background']) ==
//                 Brightness.light
//             ? Colors.black87
//             : Colors.white;

//     return Container(
//       constraints: const BoxConstraints(minHeight: 50.0),
//       width: width,
//       child: Material(
//         borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
//         color: colors['background'],
//         child: InkWell(
//           splashColor: colors['primary'],
//           borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
//           onTap: onTap,
//           child: Row(
//             children: [
//               (leading != null) ? leading! : const SizedBox(),
//               const SizedBox(width: SimpleConstants.sm),
//               Expanded(
//                 flex: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: SimpleConstants.sm,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       (tagline != null)
//                           ? SimpleText(
//                               tagline!,
//                               color: textColor,
//                               textStyle: TextStyleEnum.bodySmall,
//                             )
//                           : const SizedBox(),
//                       const SizedBox(height: 4.0),
//                       SimpleText(
//                         title,
//                         maxLines: 2,
//                         color: textColor,
//                         fontWeight: FontWeight.bold,
//                         textStyle: TextStyleEnum.bodyMedium,
//                       ),
//                       const SizedBox(height: 4.0),
//                       (subtitle != null)
//                           ? SimpleText(
//                               subtitle!,
//                               maxLines: 2,
//                               color: textColor,
//                               textStyle: TextStyleEnum.bodySmall,
//                             )
//                           : const SizedBox(),
//                     ],
//                   ),
//                 ),
//               ),
//               ...(trailing != null)
//                   ? [
//                       const SizedBox(width: SimpleConstants.sm),
//                       trailing!,
//                     ]
//                   : [const SizedBox()],
//               const SizedBox(width: SimpleConstants.sm),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
