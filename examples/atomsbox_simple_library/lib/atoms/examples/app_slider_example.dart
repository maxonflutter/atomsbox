import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppSliderExample extends StatefulWidget {
  const AppSliderExample({super.key});

  @override
  State<AppSliderExample> createState() => _AppSliderExampleState();
}

class _AppSliderExampleState extends State<AppSliderExample> {
  double sliderValueOne = 2;
  double sliderValueTwo = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSlider(
            value: sliderValueOne,
            divisions: 5,
            onChanged: (double value) {
              setState(() {
                sliderValueOne = value;
              });
            },
          ),
          AppSlider(
            thumbShape: SliderComponentShape.noThumb,
            value: sliderValueTwo,
            onChanged: (double value) {
              setState(() {
                sliderValueTwo = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
