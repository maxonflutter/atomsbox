import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SimpleLabel', () {
    testWidgets('displays text and icon with the correct color',
        (WidgetTester tester) async {
      const testText = 'Test label';
      const testIcon = Icons.check;
      const testColorPalette = ColorPalette.secondary;

      await tester.pumpWidget(
        const MySimpleLabel(
          testText: testText,
          testIcon: testIcon,
          testColorPalette: testColorPalette,
        ),
      );

      expect(find.text(testText), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);

      final iconWidget = tester.widget<Icon>(find.byIcon(testIcon));
      expect(iconWidget.color, getColorPalette(testColorPalette)['foreground']);

      final simpleTextWidget =
          tester.widget<SimpleText>(find.byType(SimpleText));
      expect(simpleTextWidget.color,
          getColorPalette(testColorPalette)['foreground']);
    });

    testWidgets('uses primary color palette by default',
        (WidgetTester tester) async {
      const testText = 'Test label';
      const testIcon = Icons.check;

      await tester.pumpWidget(
        const MySimpleLabel(
          testText: testText,
          testIcon: testIcon,
        ),
      );

      final iconWidget = tester.widget<Icon>(find.byIcon(testIcon));
      expect(iconWidget.color,
          getColorPalette(ColorPalette.primary)['foreground']);

      final simpleTextWidget =
          tester.widget<SimpleText>(find.byType(SimpleText));
      expect(simpleTextWidget.color,
          getColorPalette(ColorPalette.primary)['foreground']);
    });
  });
}

class MySimpleLabel extends StatelessWidget {
  const MySimpleLabel({
    super.key,
    required this.testText,
    required this.testIcon,
    this.testColorPalette,
  });

  final String testText;
  final IconData testIcon;
  final ColorPalette? testColorPalette;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SimpleLabel(
          text: testText,
          icon: testIcon,
          colorPalette: testColorPalette ?? ColorPalette.primary,
        ),
      ),
    );
  }
}
