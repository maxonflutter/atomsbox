// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('SimpleAudioSeekbar renders correctly',
//       (WidgetTester tester) async {
//     const simpleAudioSeekbar = SimpleAudioSeekbar(
//       position: Duration(seconds: 30),
//       duration: Duration(seconds: 100),
//     );

//     await tester.pumpWidget(
//       const MySimpleAudioSeekbar(
//         simpleAudioSeekbar: simpleAudioSeekbar,
//       ),
//     );

//     final positionTextFinder = find.text('00:30');
//     final remainingTextFinder = find.text('-01:10');

//     // Check if the position text is present
//     expect(positionTextFinder, findsOneWidget);
//     // Check if the remaining time text is present
//     expect(remainingTextFinder, findsOneWidget);
//   });
// }

// class MySimpleAudioSeekbar extends StatelessWidget {
//   const MySimpleAudioSeekbar({
//     super.key,
//     required this.simpleAudioSeekbar,
//   });

//   final SimpleAudioSeekbar simpleAudioSeekbar;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: simpleAudioSeekbar,
//         ),
//       ),
//     );
//   }
// }
