// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// class SimpleListTileExample extends StatelessWidget {
//   const SimpleListTileExample({
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
//           'These are SimpleListTile widgets',
//           textStyle: TextStyleEnum.titleMedium,
//           fontWeight: FontWeight.bold,
//           color: ThemeData.estimateBrightnessForColor(color) == Brightness.light
//               ? Colors.black87
//               : Colors.white,
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleListTile(
//           onTap: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//                 content: SimpleText(
//                   'Tapped on the list tile',
//                   color: Theme.of(context).colorScheme.onPrimaryContainer,
//                 ),
//               ),
//             );
//           },
//           leading: const SimpleImage(
//             height: 100,
//             width: 100,
//             imageUrl:
//                 'https://images.unsplash.com/photo-1679854493493-0ae0d2cb2800?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
//           ),
//           title: 'This is a title',
//           subtitle: 'This is a subtitle',
//           tagline: 'This is a tagline',
//           trailing: Row(
//             children: [
//               SimpleIconButton(
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor:
//                           Theme.of(context).colorScheme.primaryContainer,
//                       content: SimpleText(
//                         'Tapped on the traling icon',
//                         color: Theme.of(context).colorScheme.onPrimaryContainer,
//                       ),
//                     ),
//                   );
//                 },
//                 icon: Icons.add,
//                 palette: Palette.primary,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleListTile(
//           onTap: () {},
//           leading: const SimpleImage(
//             height: 100,
//             width: 100,
//             imageUrl:
//                 'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80',
//           ),
//           title: 'This is a title',
//           subtitle: 'This is a subtitle',
//           tagline: 'This is a tagline',
//           trailing: Row(
//             children: [
//               SimpleIconButton(
//                 onPressed: () {},
//                 icon: Icons.add,
//                 palette: Palette.primary,
//               ),
//             ],
//           ),
//           palette: Palette.primaryContainer,
//         ),
//         const SizedBox(height: SimpleConstants.sm),
//         SimpleListTile(
//           onTap: () {},
//           leading: const SimpleImage(
//             height: 100,
//             width: 100,
//             imageUrl:
//                 'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
//           ),
//           title: 'This is a title',
//           subtitle: 'This is a subtitle',
//           tagline: 'This is a tagline',
//           trailing: Row(
//             children: [
//               SimpleIconButton(
//                 onPressed: () {},
//                 icon: Icons.add,
//                 palette: Palette.secondary,
//               ),
//             ],
//           ),
//           palette: Palette.secondaryContainer,
//         ),
//         const SizedBox(height: SimpleConstants.lg),
//       ],
//     );
//   }
// }
