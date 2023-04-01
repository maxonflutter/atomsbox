// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// class SimpleFormExample extends StatefulWidget {
//   const SimpleFormExample({
//     super.key,
//     this.darkMode = false,
//   });

//   final bool darkMode;

//   @override
//   State<SimpleFormExample> createState() => _SimpleFormExampleState();
// }

// class _SimpleFormExampleState extends State<SimpleFormExample> {
//   var _firstValue = 'Form field 1';
//   var _secondValue = 'Form field 2';
//   var _thirdValue = 'Form field 3';

//   @override
//   Widget build(BuildContext context) {
//     List<Palette> palettes;
//     final color =
//         widget.darkMode ? Theme.of(context).colorScheme.primary : Colors.white;

//     if (widget.darkMode == false) {
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
//           'These is a SimpleForm widget',
//           textStyle: TextStyleEnum.titleMedium,
//           fontWeight: FontWeight.bold,
//           color: ThemeData.estimateBrightnessForColor(color) == Brightness.light
//               ? Colors.black87
//               : Colors.white,
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleForm(
//           formButton: SimpleButton(
//             text: 'Submit',
//             onPressed: () {},
//             palette: Palette.primary,
//           ),
//           formItems: [
//             SimpleTextFormField(
//               initialValue: _firstValue,
//               onChanged: (value) => setState(() => _firstValue = value),
//               palette: Palette.primaryDark,
//             ),
//             SimpleTextFormField(
//               initialValue: _secondValue,
//               onChanged: (value) => setState(() => _secondValue = value),
//               palette: palettes[0],
//             ),
//             SimpleTextFormField(
//               initialValue: _thirdValue,
//               onChanged: (value) => setState(() => _thirdValue = value),
//               palette: palettes[0],
//             )
//           ],
//           formItemNames: const ['Name', 'Email', 'Password'],
//         ),
//       ],
//     );
//   }
// }
