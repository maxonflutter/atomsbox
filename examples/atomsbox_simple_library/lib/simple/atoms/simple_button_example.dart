import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleButtonExample extends StatelessWidget {
  const SimpleButtonExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleButton widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            Flexible(
              child: SimpleButton(
                onPressed: () {},
                colorPalette: ColorPalette.primary,
                child: SimpleText(
                  'Button',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton(
                onPressed: () {},
                colorPalette: ColorPalette.secondary,
                child: SimpleText(
                  'Button',
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
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
                colorPalette: ColorPalette.primary,
                child: const SimpleText('Outline Button'),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton.outline(
                onPressed: () {},
                colorPalette: ColorPalette.secondary,
                child: const SimpleText('Outline Button'),
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
                colorPalette: ColorPalette.primary,
                child: const SimpleText(
                  'Text Button',
                  // Optional parameters to enhance the text button style
                  textGradient: true,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton.text(
                onPressed: () {},
                colorPalette: ColorPalette.secondary,
                child: const SimpleText(
                  'Text Button',
                  // Optional parameters to enhance the text button style
                  textGradient: true,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
