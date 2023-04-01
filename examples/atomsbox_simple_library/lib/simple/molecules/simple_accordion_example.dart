// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// class SimpleAccordionExample extends StatelessWidget {
//   const SimpleAccordionExample({
//     super.key,
//     this.darkMode = false,
//   });

//   final bool darkMode;

//   @override
//   Widget build(BuildContext context) {
//     List<Palette> palettes;
//     final color =
//         darkMode ? Theme.of(context).colorScheme.primary : Colors.white;

//     if (darkMode == false) {
//       palettes = [
//         Palette.primary,
//         Palette.primaryContainer,
//         Palette.secondary,
//         Palette.secondaryContainer,
//       ];
//     } else {
//       palettes = [
//         Palette.primaryDark,
//         Palette.primaryContainerDark,
//         Palette.secondaryDark,
//         Palette.secondaryContainerDark,
//       ];
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SimpleText(
//           'These are SimpleAccordion widgets',
//           textStyle: TextStyleEnum.titleMedium,
//           fontWeight: FontWeight.bold,
//           color: ThemeData.estimateBrightnessForColor(color) == Brightness.light
//               ? Colors.black87
//               : Colors.white,
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleAccordion(
//           initiallyExpanded: true,
//           title: 'Accordion #1',
//           palette: palettes[0],
//           children: const [
//             SimpleText(
//               'This is the child of the accordion #1',
//               textStyle: TextStyleEnum.bodySmall,
//             ),
//             SimpleText(
//               'This is another child of the accordion #1',
//               textStyle: TextStyleEnum.bodySmall,
//             ),
//           ],
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleAccordion(
//           title: 'Accordion #2',
//           palette: palettes[0],
//           children: const [
//             SimpleText(
//               'This is the child of the accordion #2',
//               textStyle: TextStyleEnum.bodySmall,
//             ),
//             SimpleText(
//               'This is another child of the accordion #2',
//               textStyle: TextStyleEnum.bodySmall,
//             )
//           ],
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleAccordion(
//           title: 'Accordion #3',
//           palette: palettes[0],
//           children: const [
//             SimpleText(
//               'This is the child of the accordion #3',
//               textStyle: TextStyleEnum.bodySmall,
//             ),
//             SimpleText(
//               'This is another child of the accordion #3',
//               textStyle: TextStyleEnum.bodySmall,
//             )
//           ],
//         ),
//         const SizedBox(height: SimpleConstants.lg),
//       ],
//     );
//   }
// }
