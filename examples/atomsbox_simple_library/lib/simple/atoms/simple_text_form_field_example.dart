import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleTextFormFieldExample extends StatelessWidget {
  const SimpleTextFormFieldExample({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          'These are SimpleTextFormField widgets',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField(
          labelText: 'Underline',
          primary: true,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField.outline(
          labelText: 'Outline',
          primary: true,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField.filled(
          labelText: 'Filled',
          primary: true,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
      ],
    );
  }
}
