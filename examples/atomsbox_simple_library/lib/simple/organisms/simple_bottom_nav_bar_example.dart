// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// class SimpleBottomNavBarExample extends StatefulWidget {
//   const SimpleBottomNavBarExample({super.key});

//   @override
//   State<SimpleBottomNavBarExample> createState() =>
//       _SimpleBottomNavBarExampleState();
// }

// class _SimpleBottomNavBarExampleState extends State<SimpleBottomNavBarExample> {
//   List<bool> _isSelected = [true, false, false];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SimpleText(
//           'This is a SimpleBottomNavBar',
//           textStyle: TextStyleEnum.titleMedium,
//           fontWeight: FontWeight.bold,
//         ),
//         SimpleBottomNavBar(
//           items: [
//             SimpleIconButton(
//               icon: Icons.home,
//               onPressed: () {
//                 setState(() {
//                   _isSelected = [true, false, false];
//                 });
//               },
//               colorPalette: _isSelected[0]
//                   ? ColorPalette.primaryContainer
//                   : ColorPalette.primary,
//             ),
//             SimpleIconButton(
//               icon: Icons.people,
//               onPressed: () {
//                 setState(() {
//                   _isSelected = [false, true, false];
//                 });
//               },
//               colorPalette: _isSelected[1]
//                   ? ColorPalette.primaryContainer
//                   : ColorPalette.primary,
//             ),
//             SimpleIconButton(
//               icon: Icons.code,
//               onPressed: () {
//                 setState(() {
//                   _isSelected = [false, false, true];
//                 });
//               },
//               colorPalette: _isSelected[2]
//                   ? ColorPalette.primaryContainer
//                   : ColorPalette.primary,
//             ),
//           ],
//         ),
//         const SizedBox(height: SimpleConstants.xlg),
//       ],
//     );
//   }
// }
