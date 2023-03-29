import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleIconButtonExample extends StatelessWidget {
  const SimpleIconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleIconButton widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Wrap(
          children: [
            SimpleIconButton(
              onPressed: () {},
              colorPalette: ColorPalette.primary,
              icon: Icons.person,
            ),
            const SizedBox(width: SimpleConstants.sm),
            SimpleIconButton(
              onPressed: () {},
              colorPalette: ColorPalette.primaryContainer,
              icon: Icons.person,
            ),
            const SizedBox(width: SimpleConstants.sm),
            SimpleIconButton(
              onPressed: () {},
              colorPalette: ColorPalette.secondary,
              icon: Icons.person,
            ),
            const SizedBox(width: SimpleConstants.sm),
            SimpleIconButton(
              onPressed: () {},
              colorPalette: ColorPalette.secondaryContainer,
              icon: Icons.person,
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
