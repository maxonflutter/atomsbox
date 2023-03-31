// import 'package:atomsbox/atomsbox.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   final onPressed = () {};
//   const child = SimpleText('Simple Button');

//   testWidgets('SimpleButton renders correctly', (WidgetTester tester) async {
//     final simpleButton = SimpleButton(
//       onPressed: onPressed,
//       minimumSize: const Size(200.0, 50.0),
//       colorPalette: ColorPalette.primary,
//       child: child,
//     );

//     await tester.pumpWidget(MySimpleButton(simpleButton: simpleButton));

//     final buttonFinder = find.byType(SimpleButton);
//     expect(buttonFinder, findsOneWidget);

//     final buttonWidget = tester.widget<SimpleButton>(buttonFinder);
//     expect(buttonWidget.onPressed, onPressed);
//     expect(buttonWidget.child, child);
//     expect(buttonWidget.minimumSize, const Size(200.0, 50.0));
//     expect(buttonWidget.colorPalette, ColorPalette.primary);
//   });
// }

// class MySimpleButton extends StatelessWidget {
//   final SimpleButton simpleButton;

//   const MySimpleButton({
//     super.key,
//     required this.simpleButton,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(child: simpleButton),
//       ),
//     );
//   }
// }
