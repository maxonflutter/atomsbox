import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleAudioSeekbarExample extends StatelessWidget {
  const SimpleAudioSeekbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SimpleText(
          'These is a SimpleAudioSeekbar widget',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleAudioSeekbar(
          position: Duration(seconds: 10),
          duration: Duration(seconds: 100),
        ),
        SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
