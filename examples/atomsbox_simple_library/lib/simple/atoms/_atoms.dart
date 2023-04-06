part of '../../main.dart';

class _Atoms extends StatelessWidget {
  const _Atoms();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: SimpleConstants.xlg),
          SimpleContainer.gradient(
            LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            height: 100,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Center(
              child: SimpleText(
                'This is a container with a gradient',
                color: Theme.of(context).colorScheme.onPrimary,
                textStyle: SimpleTextStyle.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleImage(
            'https://images.unsplash.com/photo-1680675313845-13d3f5f17080?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2671&q=80',
            height: 200,
            width: double.infinity,
            blurred: true,
            child: const SimpleText('This is a blurred image'),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleCardContainer.filled(
            child: const Center(child: Text('This is a filled card')),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleCardContainer.elevated(
            child: const Center(child: Text('This is an elevated card')),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleCardContainer.outlined(
            child: const Center(child: Text('This is an outlined card')),
          ),
          const SizedBox(height: SimpleConstants.xlg),
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
