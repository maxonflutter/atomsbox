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
                child: const Text('Elevated '),
              ),
              SimpleButton.text(
                child: const Text('Text '),
              ),
              SimpleButton.outline(
                child: const Text('Outlined '),
              ),
              SimpleIconButton(child: const Icon(Icons.offline_bolt)),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleButton.elevated(
                primary: false,
                child: const Text('Elevated '),
              ),
              SimpleButton.text(
                primary: false,
                child: const Text('Text '),
              ),
              SimpleButton.outline(
                primary: false,
                child: const Text('Outlined '),
              ),
              SimpleIconButton(
                primary: false,
                child: const Icon(
                  Icons.offline_bolt,
                ),
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
          SimpleSlider(
            value: 0.5,
            onChanged: (double) {},
          ),
          const SizedBox(height: SimpleConstants.xlg),
          const SimpleText(
            'This is a text widget',
            textStyle: SimpleTextStyle.headlineLarge,
          ),
          const SimpleText(
            'This is a text widget',
            textStyle: SimpleTextStyle.headlineMedium,
          ),
          const SimpleText(
            'This is a text widget',
            textStyle: SimpleTextStyle.headlineSmall,
          ),
          const SimpleText(
            'This is a text widget',
            textStyle: SimpleTextStyle.bodyLarge,
          ),
          const SimpleText(
            'This is a text widget',
            textStyle: SimpleTextStyle.bodyMedium,
          ),
          const SimpleText(
            'This is a text widget',
            textStyle: SimpleTextStyle.bodySmall,
          ),
        ],
      ),
    );
  }
}
