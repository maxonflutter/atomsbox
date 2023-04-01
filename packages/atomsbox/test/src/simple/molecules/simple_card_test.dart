// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('SimpleCard displays title and image',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MySimpleCard(
//         simpleCard: SimpleCard(
//           imageUrl: 'https://example.com/image.jpg',
//           title: 'Test Title',
//         ),
//       ),
//     );

//     expect(find.text('Test Title'), findsOneWidget);
//     expect(find.byType(SimpleImage), findsOneWidget);
//   });

//   testWidgets('SimpleCard displays tagline and paragraph when provided',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MySimpleCard(
//         simpleCard: SimpleCard(
//           imageUrl: 'https://example.com/image.jpg',
//           title: 'Test Title',
//           tagline: 'Test Tagline',
//           paragraph: 'Test Paragraph',
//         ),
//       ),
//     );

//     expect(find.text('Test Tagline'), findsOneWidget);
//     expect(find.text('Test Paragraph'), findsOneWidget);
//   });

//   testWidgets(
//       'SimpleCard does not display tagline and paragraph when not provided',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MySimpleCard(
//         simpleCard: SimpleCard(
//           imageUrl: 'https://example.com/image.jpg',
//           title: 'Test Title',
//         ),
//       ),
//     );

//     expect(find.text('Test Tagline'), findsNothing);
//     expect(find.text('Test Paragraph'), findsNothing);
//   });

//   testWidgets('SimpleCard onTap callback is triggered',
//       (WidgetTester tester) async {
//     bool tapped = false;
//     await tester.pumpWidget(MySimpleCard(
//       simpleCard: SimpleCard(
//         imageUrl: 'https://example.com/image.jpg',
//         title: 'Test Title',
//         onTap: () {
//           tapped = true;
//         },
//       ),
//     ));

//     await tester.tap(find.byType(InkWell));
//     await tester.pump();

//     expect(tapped, isTrue);
//   });
// }

// class MySimpleCard extends StatelessWidget {
//   final SimpleCard simpleCard;

//   const MySimpleCard({
//     super.key,
//     required this.simpleCard,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         body: Center(child: simpleCard),
//       ),
//     );
//   }
// }
