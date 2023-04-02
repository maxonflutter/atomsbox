// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   testWidgets('SimpleImage renders correctly', (WidgetTester tester) async {
//     const imageUrl = 'https://example.com/image.jpg';

//     const simpleImage = SimpleImage(
//       imageUrl: imageUrl,
//       fit: BoxFit.cover,
//       height: 200,
//       width: 200,
//     );

//     await tester.pumpWidget(MySimpleImage(simpleImage: simpleImage));

//     final imageFinder = find.byType(SimpleImage);
//     expect(imageFinder, findsOneWidget);

//     final imageWidget = tester.widget<SimpleImage>(imageFinder);
//     expect(imageWidget.imageUrl, imageUrl);
//     expect(imageWidget.fit, BoxFit.cover);
//     expect(imageWidget.height, 200);
//     expect(imageWidget.width, 200);
//   });
// }

// class MySimpleImage extends StatelessWidget {
//   final SimpleImage simpleImage;

//   const MySimpleImage({super.key, required this.simpleImage});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(child: simpleImage),
//       ),
//     );
//   }
// }
