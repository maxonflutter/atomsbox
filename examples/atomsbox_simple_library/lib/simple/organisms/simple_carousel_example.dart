import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleCarouselExample extends StatelessWidget {
  const SimpleCarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These is a SimpleCarousel widget',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleCarousel(
          carouselItems: [
            SimpleGradientContainer(
              [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary
              ],
              const [0, 1],
            ),
            SimpleGradientContainer(
              [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer
              ],
              const [0, 1],
            ),
            SimpleGradientContainer.horizontal(
              [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary
              ],
              const [0, 1],
            ),
            SimpleGradientContainer.horizontal(
              [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer
              ],
              const [0, 1],
            ),
          ],
        ),
        SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
