import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleTextExample extends StatelessWidget {
  const SimpleTextExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SimpleText(
          'SimpleText & Gradient',
          textStyle: TextStyleEnum.headlineLarge,
          textGradient: true,
        ),
        SimpleText(
          'SimpleText & Gradient',
          textStyle: TextStyleEnum.headlineMedium,
          textGradient: true,
        ),
        SimpleText(
          'SimpleText & Gradient',
          textStyle: TextStyleEnum.headlineSmall,
          textGradient: true,
        ),
        SimpleText(
          'This is a SimpleText',
          textStyle: TextStyleEnum.bodyLarge,
        ),
        SimpleText(
          'This is a SimpleText',
          textStyle: TextStyleEnum.bodyMedium,
        ),
        SimpleText(
          'This is a SimpleText',
          textStyle: TextStyleEnum.bodySmall,
        ),
        SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
