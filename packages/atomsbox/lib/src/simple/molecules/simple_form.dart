// import 'package:atomsbox/src/simple/atoms/config/simple_palettes.dart';
// import 'package:flutter/material.dart';

// import '../atoms/config/simple_app_theme.dart';
// import '../atoms/config/simple_constants.dart';
// import '../atoms/simple_button.dart';
// import '../atoms/simple_label.dart';
// import '../atoms/simple_text_form_field.dart';

// class SimpleForm extends StatefulWidget {
//   const SimpleForm({
//     super.key,
//     required this.formItems,
//     required this.formItemNames,
//     required this.formButton,
//     this.palette = Palette.primary,
//   });

//   final List<SimpleTextFormField> formItems;

//   final List<String> formItemNames;

//   final SimpleButton formButton;

//   final Palette palette;

//   @override
//   State<SimpleForm> createState() => _SimpleFormState();
// }

// class _SimpleFormState extends State<SimpleForm> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     final colors = getPalette(context, widget.palette, true);
//     final textColor =
//         ThemeData.estimateBrightnessForColor(colors['background']) ==
//                 Brightness.light
//             ? Colors.black87
//             : Colors.white;

//     return Column(
//       children: [
//         ...widget.formItems.map(
//           (item) {
//             var listIndex = widget.formItems.indexOf(item);
//             return _buildSimpleTextFormField(context, listIndex);
//           },
//         ),
//         widget.formButton,
//       ],
//     );
//   }

//   Container _buildSimpleTextFormField(
//     BuildContext context,
//     int listIndex,
//   ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
//       child: Row(
//         children: [
//           Flexible(
//             flex: 1,
//             child: SimpleLabel(
//               text: widget.formItemNames[listIndex],
//               palette: index == listIndex
//                   ? Palette.primaryDark
//                   : Palette.primaryContainerDark,
//             ),
//           ),
//           const SizedBox(width: SimpleConstants.sm),
//           Flexible(
//             flex: 3,
//             child: Focus(
//               onFocusChange: (bool value) {
//                 if (value) setState(() => index = listIndex);
//               },
//               child: widget.formItems[listIndex],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
