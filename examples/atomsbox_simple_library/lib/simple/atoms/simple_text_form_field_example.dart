import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleTextFormFieldExample extends StatelessWidget {
  const SimpleTextFormFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          'These are SimpleTextFormField widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField(initialValue: 'Initial Value'),
        SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField(),
        SizedBox(height: SimpleConstants.sm),
        SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
