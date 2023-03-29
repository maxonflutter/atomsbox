import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleAccordionExample extends StatelessWidget {
  const SimpleAccordionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SimpleText(
          'These are SimpleAccordion widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          initiallyExpanded: true,
          title: 'Accordion #1',
          children: [
            SimpleText(
              'This is the child of the accordion #1',
              textStyle: TextStyleEnum.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #1',
              textStyle: TextStyleEnum.bodySmall,
            ),
          ],
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          title: 'Accordion #2',
          children: [
            SimpleText(
              'This is the child of the accordion #2',
              textStyle: TextStyleEnum.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #2',
              textStyle: TextStyleEnum.bodySmall,
            )
          ],
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          title: 'Accordion #3',
          children: [
            SimpleText(
              'This is the child of the accordion #3',
              textStyle: TextStyleEnum.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #3',
              textStyle: TextStyleEnum.bodySmall,
            )
          ],
        ),
        SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}
