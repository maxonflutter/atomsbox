// import 'package:flutter/material.dart';

// import 'config/simple_constants.dart';
// import 'simple_text.dart';

// class SimpleChip extends StatelessWidget {
//   const SimpleChip({
//     super.key,
//     this.onPressed,
//     required this.label,
//     this.selected = false,
//     this.brightness = Brightness.light,
//     this.primary = true,
//   });

//   final VoidCallback? onPressed;
//   final String label;
//   final bool selected;
//   final bool primary;
//   final Brightness brightness;

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     Color textColor, backgroundColor, selectedColor, outlineColor;

//     switch (brightness) {
//       case Brightness.dark:
//         textColor = selected ? Colors.white : Colors.black87;
//         if (primary) {
//           backgroundColor = colorScheme.primaryContainer;
//           selectedColor = colorScheme.onPrimaryContainer;
//           outlineColor = colorScheme.primaryContainer;
//         } else {
//           backgroundColor = colorScheme.secondaryContainer;
//           selectedColor = colorScheme.onSecondaryContainer;
//           outlineColor = colorScheme.secondaryContainer;
//         }
//         break;
//       case Brightness.light:
//         textColor = Colors.white;
//         backgroundColor = Colors.transparent;
//         if (primary) {
//           selectedColor = colorScheme.primaryContainer;
//           outlineColor = colorScheme.primaryContainer;
//         } else {
//           selectedColor = colorScheme.secondaryContainer;
//           outlineColor = colorScheme.secondaryContainer;
//         }
//         break;
//     }

//     return RawChip(
//       selected: selected,
//       showCheckmark: false,
//       onPressed: onPressed,
//       backgroundColor: backgroundColor,
//       selectedColor: selectedColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
//       ),
//       side: BorderSide(color: outlineColor),
//       label: SimpleText(
//         label,
//         color: textColor,
//         textStyle: SimpleTextStyle.bodySmall,
//       ),
//     );
//   }
// }
