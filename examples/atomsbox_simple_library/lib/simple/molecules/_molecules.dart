part of '../../main.dart';

class _Molecules extends StatelessWidget {
  const _Molecules();

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: SimpleConstants.xlg),
          SimpleCard(
            onTap: () {},
            title: const SimpleText('This is a card'),
            imageUrl: imageUrl,
            subtitle: sampleText,
            paragraph: sampleText,
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleCard(
            onTap: () {},
            height: 250,
            title: const SimpleText('This is a card'),
            imageUrl: imageUrl,
            subtitle: sampleText,
            paragraph: sampleText,
            dense: false,
          ),
          const SizedBox(height: SimpleConstants.xlg),
          const SimpleToggleButtons(
            isSelected: [true, false, false, false],
            children: ['Toggle 1', 'Toggle 2', 'Toggle 3', 'Toggle 4'],
          ),
          const SizedBox(height: SimpleConstants.sm),
          const SimpleToggleButtons(
            multiSelect: true,
            isSelected: [true, true, false, false],
            children: ['Toggle 1', 'Toggle 2', 'Toggle 3', 'Toggle 4'],
          ),
          const SizedBox(height: SimpleConstants.sm),
          Row(
            children: const [
              SimpleToggleButtons(
                vertical: true,
                isSelected: [true, false, false, false],
                children: ['Toggle 1', 'Toggle 2', 'Toggle 3', 'Toggle 4'],
              ),
              SizedBox(width: SimpleConstants.sm),
              SimpleToggleButtons(
                vertical: true,
                multiSelect: true,
                isSelected: [true, true, false, false],
                children: ['Toggle 1', 'Toggle 2', 'Toggle 3', 'Toggle 4'],
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleListTile(
            leading: SimpleImage(
              imageUrl,
              width: 80,
              height: 80,
            ),
            title: const SimpleText(
              'This is a list tile',
              textStyle: SimpleTextStyle.bodyLarge,
              fontWeight: FontWeight.bold,
            ),
            subtitle: const SimpleText(sampleText, maxLines: 3),
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleListTile(
            leading: SimpleImage(
              imageUrl,
              width: 80,
              height: 80,
            ),
            title: const SimpleText(
              'This is a list tile',
              textStyle: SimpleTextStyle.bodyLarge,
              fontWeight: FontWeight.bold,
            ),
            subtitle: const SimpleText(sampleText, maxLines: 3),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleExpansionTile(
            initiallyExpanded: true,
            title: const SimpleText('This is an expansion tile'),
            children: [
              const SimpleText(sampleText),
              SimpleIconButton(child: Icon(Icons.abc_outlined)),
              SimpleButton.elevated(
                child: Text('Button'),
              )
            ],
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleExpansionTile(
            title: const SimpleText('This is an expansion tile'),
            children: const [SimpleText(sampleText)],
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleExpansionTile.transparent(
            title: const SimpleText('This is an expansion tile'),
            children: const [SimpleText(sampleText)],
          ),
        ],
      ),
    );
  }
}
