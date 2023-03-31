// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   group('SimpleText', () {
//     setUp(() => GoogleFonts.config.allowRuntimeFetching = false);

//     testWidgets('displays text with the correct style',
//         (WidgetTester tester) async {
//       const testText = 'Test text';
//       const textStyle = TextStyleEnum.bodyLarge;

//       await tester.pumpWidget(
//         const MySimpleText(
//           testText: testText,
//           textStyle: textStyle,
//         ),
//       );

//       expect(find.text(testText), findsOneWidget);
//       final textWidget = tester.widget<Text>(find.text(testText));
//       expect(textWidget.style, isNotNull);
//     });

//     testWidgets('displays text with custom properties',
//         (WidgetTester tester) async {
//       const testText = 'Custom text';
//       const testColor = Colors.red;
//       const testFontSize = 24.0;
//       const testFontWeight = FontWeight.bold;
//       const testLetterSpacing = 2.0;

//       await tester.pumpWidget(
//         const MySimpleText(
//           testText: testText,
//           testColor: testColor,
//           testFontSize: testFontSize,
//           testFontWeight: testFontWeight,
//           testLetterSpacing: testLetterSpacing,
//         ),
//       );

//       expect(find.text(testText), findsOneWidget);

//       final textWidget = tester.widget<Text>(find.text(testText));
//       expect(textWidget.style, isNotNull);
//       expect(textWidget.style!.color, testColor);
//       expect(textWidget.style!.fontSize, testFontSize);
//       expect(textWidget.style!.fontWeight, testFontWeight);
//       expect(textWidget.style!.letterSpacing, testLetterSpacing);
//     });
//   });
// }

// class MySimpleText extends StatelessWidget {
//   const MySimpleText({
//     super.key,
//     required this.testText,
//     this.textStyle,
//     this.testColor,
//     this.testFontSize,
//     this.testFontWeight,
//     this.testLetterSpacing,
//   });

//   final String testText;
//   final TextStyleEnum? textStyle;
//   final MaterialColor? testColor;
//   final double? testFontSize;
//   final FontWeight? testFontWeight;
//   final double? testLetterSpacing;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: simpleAppTheme(),
//       home: Scaffold(
//         body: SimpleText(
//           testText,
//           color: testColor,
//           fontSize: testFontSize,
//           fontWeight: testFontWeight,
//           letterSpacing: testLetterSpacing,
//         ),
//       ),
//     );
//   }
// }
