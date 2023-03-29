import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SimpleGradientContainer renders correctly',
      (WidgetTester tester) async {
    const gradientContainer = SimpleGradientContainer(
      [Colors.blue, Colors.red],
      [0.0, 1.0],
      width: 100,
      height: 100,
    );

    await tester.pumpWidget(
      const MySimpleGradientContainer(
        container: gradientContainer,
      ),
    );

    final containerFinder = find.byType(SimpleGradientContainer);
    expect(containerFinder, findsOneWidget);

    final containerWidget =
        tester.widget<SimpleGradientContainer>(containerFinder);
    expect(containerWidget.colors, [Colors.blue, Colors.red]);
    expect(containerWidget.stops, [0.0, 1.0]);
    expect(containerWidget.width, 100);
    expect(containerWidget.height, 100);
    expect(containerWidget.begin, Alignment.topCenter);
    expect(containerWidget.end, Alignment.bottomCenter);
  });

  testWidgets('SimpleGradientContainer.horizontal renders correctly',
      (WidgetTester tester) async {
    const gradientContainer = SimpleGradientContainer.horizontal(
      [Colors.green, Colors.yellow],
      [0.0, 1.0],
      width: 100,
      height: 100,
    );

    await tester.pumpWidget(
      const MySimpleGradientContainer(container: gradientContainer),
    );

    final containerFinder = find.byType(SimpleGradientContainer);
    expect(containerFinder, findsOneWidget);

    final containerWidget =
        tester.widget<SimpleGradientContainer>(containerFinder);
    expect(containerWidget.colors, [Colors.green, Colors.yellow]);
    expect(containerWidget.stops, [0.0, 1.0]);
    expect(containerWidget.width, 100);
    expect(containerWidget.height, 100);
    expect(containerWidget.begin, Alignment.centerLeft);
    expect(containerWidget.end, Alignment.centerRight);
  });
}

class MySimpleGradientContainer extends StatelessWidget {
  const MySimpleGradientContainer({
    super.key,
    required this.container,
  });

  final SimpleGradientContainer container;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: container),
      ),
    );
  }
}
