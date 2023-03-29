import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SimpleTextFormField renders correctly',
      (WidgetTester tester) async {
    final textFormField = SimpleTextFormField(
      initialValue: 'Test',
      obscureText: false,
    );

    await tester
        .pumpWidget(MySimpleTextFormField(textFormField: textFormField));

    final textFieldFinder = find.byType(SimpleTextFormField);
    expect(textFieldFinder, findsOneWidget);

    final textFieldWidget = tester.widget<SimpleTextFormField>(textFieldFinder);
    expect(textFieldWidget.initialValue, 'Test');
    expect(textFieldWidget.obscureText, false);
  });

  testWidgets('SimpleTextFormField.outline renders correctly',
      (WidgetTester tester) async {
    final textFormField = SimpleTextFormField.outline(
      initialValue: 'Test',
      obscureText: true,
    );

    await tester
        .pumpWidget(MySimpleTextFormField(textFormField: textFormField));

    final textFieldFinder = find.byType(SimpleTextFormField);
    expect(textFieldFinder, findsOneWidget);

    final textFieldWidget = tester.widget<SimpleTextFormField>(textFieldFinder);
    expect(textFieldWidget.initialValue, 'Test');
    expect(textFieldWidget.obscureText, true);
  });

  testWidgets('SimpleTextFormField.filled renders correctly',
      (WidgetTester tester) async {
    final textFormField = SimpleTextFormField.filled(
      initialValue: 'Test',
      obscureText: false,
    );

    await tester
        .pumpWidget(MySimpleTextFormField(textFormField: textFormField));

    final textFieldFinder = find.byType(SimpleTextFormField);
    expect(textFieldFinder, findsOneWidget);

    final textFieldWidget = tester.widget<SimpleTextFormField>(textFieldFinder);
    expect(textFieldWidget.initialValue, 'Test');
    expect(textFieldWidget.obscureText, false);
  });
}

class MySimpleTextFormField extends StatelessWidget {
  const MySimpleTextFormField({
    super.key,
    required this.textFormField,
  });

  final SimpleTextFormField textFormField;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: textFormField),
      ),
    );
  }
}
