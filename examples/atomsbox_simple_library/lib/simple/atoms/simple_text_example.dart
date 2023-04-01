import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleTextExample extends StatelessWidget {
  const SimpleTextExample({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              'SimpleText',
              textStyle: SimpleTextStyle.headlineLarge,
              color: darkMode ? Colors.white : Colors.black87,
            ),
            SimpleText(
              'SimpleText',
              textStyle: SimpleTextStyle.headlineMedium,
              color: darkMode ? Colors.white : Colors.black87,
            ),
            SimpleText(
              'SimpleText',
              textStyle: SimpleTextStyle.headlineSmall,
              color: darkMode ? Colors.white : Colors.black87,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              'This is a SimpleText',
              textStyle: SimpleTextStyle.bodyLarge,
              color: darkMode ? Colors.white : Colors.black87,
            ),
            SimpleText(
              'This is a SimpleText',
              textStyle: SimpleTextStyle.bodyMedium,
              color: darkMode ? Colors.white : Colors.black87,
            ),
            SimpleText(
              'This is a SimpleText',
              textStyle: SimpleTextStyle.bodySmall,
              color: darkMode ? Colors.white : Colors.black87,
            ),
          ],
        ),
      ],
    );
  }
}
