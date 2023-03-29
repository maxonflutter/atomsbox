import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleAudioControlsExample extends StatelessWidget {
  const SimpleAudioControlsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These is a SimpleAudioControls widget',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleAudioControls(
          play: () {},
          pause: () {},
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
