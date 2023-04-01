import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleAccordionExample extends StatelessWidget {
  const SimpleAccordionExample({
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
          'These are SimpleAccordion widgets',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          initiallyExpanded: true,
          title: 'Accordion #1',
          brightness: darkMode ? Brightness.dark : Brightness.light,
          children: const [
            SimpleText(
              'This is the child of the accordion #1',
              textStyle: SimpleTextStyle.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #1',
              textStyle: SimpleTextStyle.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          title: 'Accordion #2',
          brightness: darkMode ? Brightness.dark : Brightness.light,
          children: const [
            SimpleText(
              'This is the child of the accordion #2',
              textStyle: SimpleTextStyle.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #2',
              textStyle: SimpleTextStyle.bodySmall,
            )
          ],
        ),
      ],
    );
  }
}
