import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleTextFormFieldExample extends StatelessWidget {
  const SimpleTextFormFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleTextFormField widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField(labelText: 'Underline'),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField.outline(
          labelText: 'Outline',
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField.filled(
          labelText: 'Filled',
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
