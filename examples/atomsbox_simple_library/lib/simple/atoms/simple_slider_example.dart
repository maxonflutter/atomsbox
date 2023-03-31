import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleSliderExample extends StatefulWidget {
  const SimpleSliderExample({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  State<SimpleSliderExample> createState() => _SimpleSliderExampleState();
}

class _SimpleSliderExampleState extends State<SimpleSliderExample> {
  final _value = [1.0, 5.0, 3.0, 7.0];

  @override
  Widget build(BuildContext context) {
    List<Palette> palettes;
    final color =
        widget.darkMode ? Theme.of(context).colorScheme.primary : Colors.white;

    if (widget.darkMode == false) {
      palettes = [
        Palette.primary,
        Palette.primary,
        Palette.secondary,
        Palette.secondary,
      ];
    } else {
      palettes = [
        Palette.primaryDark,
        Palette.primaryDark,
        Palette.primaryContainerDark,
        Palette.primaryContainerDark,
      ];
    }
    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleText(
            'These are SimpleSlider widgets',
            textStyle: TextStyleEnum.titleMedium,
            fontWeight: FontWeight.bold,
            color:
                ThemeData.estimateBrightnessForColor(color) == Brightness.light
                    ? Colors.black87
                    : Colors.white,
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
            palette: palettes[0],
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleSlider(
            value: _value[1],
            onChanged: (value) {
              setState(() {
                _value[1] = value;
              });
            },
            palette: palettes[1],
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
            palette: palettes[2],
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleSlider(
            value: _value[3],
            onChanged: (value) {
              setState(() {
                _value[3] = value;
              });
            },
            palette: palettes[3],
          ),
        ],
      ),
    );
  }
}
