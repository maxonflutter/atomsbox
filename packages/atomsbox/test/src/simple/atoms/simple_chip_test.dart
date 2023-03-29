import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SimpleChip displays the provided label',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MySimpleChip(
        simpleChip: SimpleChip(label: 'Test Chip'),
      ),
    );

    expect(find.text('Test Chip'), findsOneWidget);
  });

  testWidgets('SimpleChip displays a border when not selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MySimpleChip(
        simpleChip: SimpleChip(label: 'Test Chip', selected: false),
      ),
    );

    final chip = tester.widget<RawChip>(find.byType(RawChip));
    expect(chip.side, isNotNull);
  });

  testWidgets('SimpleChip displays a checkmark when selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MySimpleChip(
        simpleChip: SimpleChip(label: 'Test Chip', selected: true),
      ),
    );

    final chip = tester.widget<RawChip>(find.byType(RawChip));
    expect(chip.selected, true);
  });

  testWidgets('SimpleChip calls onPressed when tapped',
      (WidgetTester tester) async {
    bool onPressedCalled = false;

    await tester.pumpWidget(MySimpleChip(
      simpleChip: SimpleChip(
        label: 'Test Chip',
        onPressed: () {
          onPressedCalled = true;
        },
      ),
    ));

    await tester.tap(find.byType(RawChip));
    await tester.pumpAndSettle();

    expect(onPressedCalled, true);
  });
}

class MySimpleChip extends StatelessWidget {
  const MySimpleChip({
    super.key,
    required this.simpleChip,
  });

  final SimpleChip simpleChip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: simpleChip),
      ),
    );
  }
}
