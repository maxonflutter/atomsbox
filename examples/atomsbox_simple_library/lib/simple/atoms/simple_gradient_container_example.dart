import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleGradientContainerExample extends StatelessWidget {
  const SimpleGradientContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleGradientContainer widgets',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleGradientContainer(
          [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ],
          const [0, 1],
          height: 200,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleGradientContainer(
          [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer
          ],
          const [0, 1],
          height: 200,
        ),
      ],
    );
  }
}
