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
          SimpleForm(
            title: const SimpleText('This is a form'),
            description: const SimpleText('This is a form description'),
            formButton: SimpleButton.elevated(
              onPressed: () {},
              child: const SimpleText('Submit'),
            ),
            formItemNames: const ['One', 'Two', 'Three'],
            formItems: [
              SimpleTextFormField(),
              SimpleTextFormField(),
              SimpleTextFormField(),
            ],
          ),
          const SizedBox(height: SimpleConstants.xlg),

          // SimpleCardGeneric(
          //   title: const SimpleText('This is a card'),
          //   imageUrl: imageUrl,
          //   subtitle: sampleText,
          //   paragraph: sampleText,
          // ),
          // const SizedBox(height: SimpleConstants.sm),
          // SimpleCardGeneric(
          //   onTap: () {},
          //   height: 250,
          //   title: const SimpleText('This is a card'),
          //   imageUrl: imageUrl,
          //   subtitle: sampleText,
          //   paragraph: sampleText,
          //   dense: false,
          // ),
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

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return Scaffold(
      appBar: AppBar(title: SimpleText('Cards')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SimpleConstants.sm),
          child: Column(
            children: [
              SimpleCardUser(
                height: 400,
                dense: false,
                headline: SimpleText('Massimo Del Pezzo'),
                supportingText: sampleText,
                imageUrl: imageUrl,
                backgroundImageUrl: imageUrl,
                actions: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleButton.text(
                      onPressed: () {},
                      child: const SimpleText('Add'),
                    ),
                    SimpleButton.text(
                      onPressed: () {},
                      child: const SimpleText('Follow'),
                    ),
                  ],
                ),
              ),
              SimpleCardGeneric(
                onTap: () {},
                margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
                headline: const SimpleText('This is a card'),
                subhead: sampleText,
                supportingText: sampleText,
                imageUrl: imageUrl,
                type: SimpleCardType.filled,
              ),
              SimpleCardGeneric(
                onTap: () {},
                headline: const SimpleText('This is a card'),
                subhead: sampleText,
                supportingText: sampleText,
                imageUrl: imageUrl,
                height: 250,
                margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
                type: SimpleCardType.outlined,
                dense: false,
              ),
              SimpleCard.filled(
                onTap: () {},
                height: 100,
                margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
                child: const Center(
                  child: SimpleText('Simple Card'),
                ),
              ),
              SimpleCard.outlined(
                onTap: () {},
                height: 100,
                margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
                child: const Center(
                  child: SimpleText('Simple Card'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
