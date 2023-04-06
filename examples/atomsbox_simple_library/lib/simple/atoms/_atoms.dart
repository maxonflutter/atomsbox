part of '../../main.dart';

class _Atoms extends StatelessWidget {
  const _Atoms();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: SimpleConstants.xlg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleButton.elevated(
                onPressed: () {},
                child: const Text('Elevated '),
              ),
              SimpleButton.text(
                onPressed: () {},
                child: const Text('Text '),
              ),
              SimpleButton.outline(
                onPressed: () {},
                child: const Text('Outlined '),
              ),
              SimpleIconButton(
                onPressed: () {},
                child: const Icon(Icons.offline_bolt),
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleButton.elevated(
                primary: false,
                onPressed: () {},
                child: const Text('Elevated '),
              ),
              SimpleButton.text(
                primary: false,
                onPressed: () {},
                child: const Text('Text '),
              ),
              SimpleButton.outline(
                primary: false,
                onPressed: () {},
                child: const Text('Outlined '),
              ),
              SimpleIconButton(
                primary: false,
                onPressed: () {},
                child: const Icon(Icons.offline_bolt),
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleTextFormField(
            labelText: 'Underlined',
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleTextFormField.filled(
            labelText: 'Filled',
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleTextFormField.outlined(
            labelText: 'Outlined',
          ),
          const SizedBox(height: SimpleConstants.xlg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SimpleLabel(
                icon: Icons.abc,
                text: 'This is a label w/ icon',
              ),
              SimpleLabel(
                text: 'This is a label',
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SimpleLabel(
                icon: Icons.abc,
                text: 'This is a label w/ icon',
                primary: false,
              ),
              SimpleLabel(
                text: 'This is a label',
                primary: false,
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),
          const SliderExampleOne(),
          const SizedBox(height: SimpleConstants.sm),
          const SliderExampleTwo(),
          const SizedBox(height: SimpleConstants.xlg),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SimpleText(
                'Display Large',
                textStyle: SimpleTextStyle.displayLarge,
              ),
              SimpleText(
                'Display Medium',
                textStyle: SimpleTextStyle.displayMedium,
              ),
              SimpleText(
                'Display Small',
                textStyle: SimpleTextStyle.displaySmall,
              ),
              SimpleText(
                'Headline Large',
                textStyle: SimpleTextStyle.headlineLarge,
              ),
              SimpleText(
                'Headline Medium',
                textStyle: SimpleTextStyle.headlineMedium,
              ),
              SimpleText(
                'Headline Small',
                textStyle: SimpleTextStyle.headlineSmall,
              ),
              SimpleText(
                'Body Large',
                textStyle: SimpleTextStyle.bodyLarge,
              ),
              SimpleText(
                'Body Medium',
                textStyle: SimpleTextStyle.bodyMedium,
              ),
              SimpleText(
                'Body Small',
                textStyle: SimpleTextStyle.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SliderExampleOne extends StatefulWidget {
  const SliderExampleOne({
    super.key,
  });

  @override
  State<SliderExampleOne> createState() => _SliderExampleOneState();
}

class _SliderExampleOneState extends State<SliderExampleOne> {
  double sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return SimpleSlider(
      value: sliderValue,
      showMinValue: true,
      showMaxValue: true,
      divisions: 5,
      onChanged: (double value) {
        setState(() {
          sliderValue = value;
        });
      },
    );
  }
}

class SliderExampleTwo extends StatefulWidget {
  const SliderExampleTwo({
    super.key,
  });

  @override
  State<SliderExampleTwo> createState() => _SliderExampleTwoState();
}

class _SliderExampleTwoState extends State<SliderExampleTwo> {
  double sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return SimpleSlider(
      value: sliderValue,
      divisions: 5,
      onChanged: (double value) {
        setState(() {
          sliderValue = value;
        });
      },
    );
  }
}
