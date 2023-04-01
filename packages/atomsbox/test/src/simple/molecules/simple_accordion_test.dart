// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('SimpleAccordion renders correctly and expands/collapses',
//       (WidgetTester tester) async {
//     const simpleAccordion = SimpleAccordion(
//       title: 'Test Accordion',
//       children: [
//         SimpleText('Child 1'),
//         SimpleText('Child 2'),
//       ],
//     );

//     await tester.pumpWidget(
//       const MySimpleAccordion(
//         simpleAccordion: simpleAccordion,
//       ),
//     );

//     final titleFinder = find.text('Test Accordion');
//     expect(titleFinder, findsOneWidget);

//     final child1Finder = find.text('Child 1');
//     final child2Finder = find.text('Child 2');

//     // Initially collapsed
//     expect(child1Finder, findsNothing);
//     expect(child2Finder, findsNothing);

//     // Expand the accordion
//     await tester.tap(titleFinder);
//     await tester.pumpAndSettle();

//     // Check if children are visible
//     expect(child1Finder, findsOneWidget);
//     expect(child2Finder, findsOneWidget);

//     // Collapse the accordion
//     await tester.tap(titleFinder);
//     await tester.pumpAndSettle();

//     // Check if children are hidden
//     expect(child1Finder, findsNothing);
//     expect(child2Finder, findsNothing);
//   });
// }

// class MySimpleAccordion extends StatelessWidget {
//   const MySimpleAccordion({
//     super.key,
//     required this.simpleAccordion,
//   });

//   final SimpleAccordion simpleAccordion;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: simpleAccordion,
//         ),
//       ),
//     );
//   }
// }
