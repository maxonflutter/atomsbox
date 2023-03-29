import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleToggleButtonsExample extends StatelessWidget {
  const SimpleToggleButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SimpleText(
          'These are SimpleToggleButtons',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: true,
          isSelected: [true, true, false],
          children: [
            SimpleText('First'),
            SimpleText('Second'),
            SimpleText('Third'),
          ],
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: false,
          vertical: true,
          isSelected: [true, false, false],
          children: [
            SimpleText('First'),
            SimpleText('Second'),
            SimpleText('Third'),
          ],
        ),
        SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}
