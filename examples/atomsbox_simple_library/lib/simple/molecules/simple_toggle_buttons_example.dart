// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// class SimpleToggleButtonsExample extends StatelessWidget {
//   const SimpleToggleButtonsExample({
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
//           'These are SimpleToggleButtons',
//           textStyle: TextStyleEnum.titleMedium,
//           fontWeight: FontWeight.bold,
//           color: ThemeData.estimateBrightnessForColor(color) == Brightness.light
//               ? Colors.black87
//               : Colors.white,
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleToggleButtons(
//           multiSelect: true,
//           isSelected: const [true, true, false],
//           children: const ['First', 'Second', 'Third'],
//           palette: palettes[0],
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleToggleButtons(
//           multiSelect: false,
//           // vertical: true,
//           isSelected: const [true, false, false],
//           children: const ['First', 'Second', 'Third'],
//           palette: palettes[1],
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleToggleButtons(
//           multiSelect: true,
//           isSelected: const [true, true, false],
//           children: const ['First', 'Second', 'Third'],
//           palette: palettes[2],
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleToggleButtons(
//           multiSelect: false,
//           // vertical: true,
//           isSelected: const [true, false, false],
//           children: const ['First', 'Second', 'Third'],
//           palette: palettes[3],
//         ),
//         const SizedBox(height: SimpleConstants.lg),
//       ],
//     );
//   }
// }
