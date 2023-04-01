import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleToggleButtonsExample extends StatelessWidget {
  const SimpleToggleButtonsExample({
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
          'These are SimpleToggleButtons',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: true,
          isSelected: const [true, true, false],
          children: const ['First', 'Second', 'Third'],
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: false,
          // vertical: true,
          isSelected: const [true, false, false],
          children: const ['First', 'Second', 'Third'],
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: true,
          isSelected: const [true, true, false],
          children: const ['First', 'Second', 'Third'],
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: false,
          // vertical: true,
          isSelected: const [true, false, false],
          children: const ['First', 'Second', 'Third'],
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}
