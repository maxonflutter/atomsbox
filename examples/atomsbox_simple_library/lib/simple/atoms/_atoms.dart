part of '../../main.dart';

class _Atoms extends StatelessWidget {
  const _Atoms();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: SimpleConstants.xlg),
          SimpleTextFormField(
            labelText: 'Underlined',
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleTextFormField.filled(
            labelText: 'Filled',
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleTextFormField.outline(
            labelText: 'Outlined',
          ),
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: const [
          //     SimpleLabel(
          //       icon: Icons.abc,
          //       text: 'This is a label w/ icon',
          //     ),
          //     SimpleLabel(
          //       text: 'This is a label',
          //     ),
          //   ],
          // ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleSlider(
            value: 0.5,
            onChanged: (double) {},
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleSlider(
            value: 0.5,
            thumbShape: SliderComponentShape.noThumb,
            onChanged: (double) {},
          ),
          const SizedBox(height: SimpleConstants.xlg),

          Column(
            children: [
              Text(
                'This is a text widget',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'This is a text widget',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'This is a text widget',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          Theme(
            data: SimpleTheme.darkTheme,
            child: Column(
              children: [
                Text(
                  'This is a text widget',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'This is a text widget',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'This is a text widget',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          // const SimpleText(
          //   'This is a text widget',
          //   textStyle: SimpleTextStyle.headlineLarge,
          // ),
          // const SimpleText(
          //   'This is a text widget',
          //   textStyle: SimpleTextStyle.headlineMedium,
          // ),
          // const SimpleText(
          //   'This is a text widget',
          //   textStyle: SimpleTextStyle.headlineSmall,
          // ),
          // const SimpleText(
          //   'This is a text widget',
          //   textStyle: SimpleTextStyle.bodyLarge,
          // ),
          // const SimpleText(
          //   'This is a text widget',
          //   textStyle: SimpleTextStyle.bodyMedium,
          // ),
          // const SimpleText(
          //   'This is a text widget',
          //   textStyle: SimpleTextStyle.bodySmall,
          // ),
        ],
      ),
    );
  }
}
