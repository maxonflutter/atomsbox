import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleSliderExample extends StatefulWidget {
  const SimpleSliderExample({super.key});

  @override
  State<SimpleSliderExample> createState() => _SimpleSliderExampleState();
}

class _SimpleSliderExampleState extends State<SimpleSliderExample> {
  final _value = [1.0, 5.0, 3.0, 7.0];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleSlider widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[0],
          onChanged: (value) {
            setState(() {
              _value[0] = value;
            });
          },
          thumbShape: SliderComponentShape.noThumb,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[1],
          onChanged: (value) {
            setState(() {
              _value[1] = value;
            });
          },
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[2],
          onChanged: (value) {
            setState(() {
              _value[2] = value;
            });
          },
          thumbShape: SliderComponentShape.noThumb,
          colorPalette: ColorPalette.secondaryContainer,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[3],
          onChanged: (value) {
            setState(() {
              _value[3] = value;
            });
          },
          colorPalette: ColorPalette.secondaryContainer,
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
