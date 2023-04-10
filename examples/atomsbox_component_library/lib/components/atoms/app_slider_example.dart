import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

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
    return Scaffold(
      appBar: ExampleAppBar(),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
