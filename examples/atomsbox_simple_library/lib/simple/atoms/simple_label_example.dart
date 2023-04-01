import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleLabelExample extends StatelessWidget {
  const SimpleLabelExample({
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
          'These are SimpleLabel widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            SimpleLabel(
              icon: Icons.person,
              text: 'This is a label',
              brightness: darkMode ? Brightness.dark : Brightness.light,
            ),
            const SizedBox(width: SimpleConstants.sm),
            SimpleLabel(
              icon: Icons.person,
              text: 'This is a label',
              primary: false,
              brightness: darkMode ? Brightness.dark : Brightness.light,
            ),
          ],
        ),
      ],
    );
  }
}
