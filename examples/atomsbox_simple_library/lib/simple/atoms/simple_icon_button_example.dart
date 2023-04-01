import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleIconButtonExample extends StatelessWidget {
  const SimpleIconButtonExample({
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
          'These are SimpleIconButton widgets',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            SimpleIconButton(
              onPressed: () {},
              icon: Icons.person,
              brightness: darkMode ? Brightness.dark : Brightness.light,
            ),
            const SizedBox(width: SimpleConstants.sm),
            SimpleIconButton(
              onPressed: () {},
              icon: Icons.person,
              primary: false,
              brightness: darkMode ? Brightness.dark : Brightness.light,
            ),
          ],
        ),
      ],
    );
  }
}
