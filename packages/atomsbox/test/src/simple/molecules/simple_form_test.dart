import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SimpleForm renders correctly with the provided form items',
      (WidgetTester tester) async {
    final formItems = [
      SimpleTextFormField(),
      SimpleTextFormField(),
    ];

    final formItemNames = ['Email', 'Password'];
    final formButton = SimpleButton(
      onPressed: () {},
      child: const SimpleText('Submit'),
    );

    final simpleForm = SimpleForm(
      formItems: formItems,
      formItemNames: formItemNames,
      formButton: formButton,
    );

    await tester.pumpWidget(MySimpleForm(simpleForm: simpleForm));

    final emailLabelFinder = find.text('Email');
    final passwordLabelFinder = find.text('Password');
    final submitButtonFinder = find.text('Submit');

    // Check if form item labels are present
    expect(emailLabelFinder, findsOneWidget);
    expect(passwordLabelFinder, findsOneWidget);

    // Check if form items are present
    expect(find.byType(SimpleTextFormField), findsNWidgets(2));

    // Check if submit button is present
    expect(submitButtonFinder, findsOneWidget);
  });
}

class MySimpleForm extends StatelessWidget {
  const MySimpleForm({super.key, required this.simpleForm});

  final SimpleForm simpleForm;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: simpleForm,
        ),
      ),
    );
  }
}
