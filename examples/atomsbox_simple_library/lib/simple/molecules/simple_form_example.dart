import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleFormExample extends StatefulWidget {
  const SimpleFormExample({super.key});

  @override
  State<SimpleFormExample> createState() => _SimpleFormExampleState();
}

class _SimpleFormExampleState extends State<SimpleFormExample> {
  var _firstValue = 'Form field 1';
  var _secondValue = 'Form field 2';
  var _thirdValue = 'Form field 3';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These is a SimpleForm widget',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleForm(
          formButton: SimpleButton(
            onPressed: () {},
            colorPalette: ColorPalette.primary,
            child: SimpleText(
              'Submit',
              color: Theme.of(context).colorScheme.onPrimary,
              textStyle: TextStyleEnum.bodyLarge,
            ),
          ),
          formItems: [
            SimpleTextFormField(
              initialValue: _firstValue,
              onChanged: (value) => setState(() => _firstValue = value),
            ),
            SimpleTextFormField(
              initialValue: _secondValue,
              onChanged: (value) => setState(() => _secondValue = value),
            ),
            SimpleTextFormField(
              initialValue: _thirdValue,
              onChanged: (value) => setState(() => _thirdValue = value),
            )
          ],
          formItemNames: const ['Name', 'Email', 'Password'],
        ),
        const SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}
