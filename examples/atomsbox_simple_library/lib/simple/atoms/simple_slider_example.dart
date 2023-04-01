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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          'These are SimpleSlider widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
          color: widget.darkMode ? Colors.white : Colors.black87,
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
          primary: true,
          brightness: widget.darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[1],
          onChanged: (value) {
            setState(() {
              _value[1] = value;
            });
          },
          primary: false,
          brightness: widget.darkMode ? Brightness.dark : Brightness.light,
        ),
      ],
    );
  }
}
