// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// class SimpleDrawerExample extends StatelessWidget {
//   const SimpleDrawerExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SimpleText(
//           'This is a SimpleDrawer widget',
//           textStyle: TextStyleEnum.titleMedium,
//           fontWeight: FontWeight.bold,
//         ),
//         Row(
//           children: [
//             SimpleIconButton(
//               icon: Icons.menu,
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             ),
//             const SizedBox(width: 8.0),
//             const SimpleText('Click to open the drawer'),
//           ],
//         ),
//         const SizedBox(height: SimpleConstants.xlg),
//       ],
//     );
//   }
// }
