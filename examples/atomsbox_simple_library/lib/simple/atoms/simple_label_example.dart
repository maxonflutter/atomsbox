import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleLabelExample extends StatelessWidget {
  const SimpleLabelExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleLabel widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: const [
            SimpleLabel(
              icon: Icons.person,
              text: 'This is a label',
              colorPalette: ColorPalette.primary,
            ),
            SizedBox(width: SimpleConstants.sm),
            SimpleLabel(
              icon: Icons.person,
              text: 'This is a label',
              colorPalette: ColorPalette.primaryContainer,
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: const [
            SimpleLabel(
              icon: Icons.person,
              text: 'This is a label',
              colorPalette: ColorPalette.secondary,
            ),
            SizedBox(width: SimpleConstants.sm),
            SimpleLabel(
              icon: Icons.person,
              text: 'This is a label',
              colorPalette: ColorPalette.secondaryContainer,
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
