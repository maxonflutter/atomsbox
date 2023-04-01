import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleButtonExample extends StatelessWidget {
  const SimpleButtonExample({
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
          'These are SimpleButton widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            Flexible(
              child: SimpleButton(
                onPressed: () {},
                brightness: darkMode ? Brightness.dark : Brightness.light,
                child: SimpleText('Button'),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton(
                onPressed: () {},
                brightness: darkMode ? Brightness.dark : Brightness.light,
                primary: false,
                child: SimpleText('Button'),
              ),
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            Flexible(
              child: SimpleButton.outline(
                onPressed: () {},
                brightness: darkMode ? Brightness.dark : Brightness.light,
                child: SimpleText('Button'),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton.outline(
                onPressed: () {},
                brightness: darkMode ? Brightness.dark : Brightness.light,
                primary: false,
                child: SimpleText('Button'),
              ),
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            Flexible(
              child: SimpleButton.text(
                onPressed: () {},
                brightness: darkMode ? Brightness.dark : Brightness.light,
                child: SimpleText('Button'),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton.text(
                onPressed: () {},
                brightness: darkMode ? Brightness.dark : Brightness.light,
                primary: false,
                child: SimpleText('Button'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
