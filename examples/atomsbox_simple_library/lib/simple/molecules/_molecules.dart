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
          SimpleListTile(
            onTap: () {},
            leading: const CircleAvatar(radius: 24),
            title: const SimpleText('This is a list tile'),
            subtitle: const SimpleText(sampleText),
            trailing: const Icon(Icons.offline_bolt),
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleListTile(
            onTap: () {},
            isThreeLine: true,
            leading: SimpleImage(imageUrl, height: 48),
            title: const SimpleText('This is a list tile'),
            subtitle: const SimpleText(sampleText),
            trailing: const Icon(Icons.offline_bolt),
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleListTile(
            onTap: () {},
            primary: true,
            isThreeLine: true,
            leadingWidth: 96,
            leading: SimpleImage(imageUrl, height: 96),
            title: const SimpleText('This is a list tile'),
            subtitle: const SimpleText(sampleText),
            trailing: const Icon(Icons.offline_bolt),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleExpansionTile(
            initiallyExpanded: true,
            title: const SimpleText('This is an expansion tile'),
            children: const [SimpleText(sampleText)],
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
          const SizedBox(height: SimpleConstants.xlg),
          SimpleCard(
            onTap: () {},
            height: 200,
            margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
            headline: const SimpleText('This is a card'),
            subhead: sampleText,
            supportingText: sampleText,
            image: SimpleImage(imageUrl),
            type: SimpleCardContainerType.filled,
          ),
          SimpleCard(
            dense: false,
            onTap: () {},
            margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
            headline: const SimpleText('This is a card'),
            subhead: sampleText,
            supportingText: sampleText,
            image: SimpleImage(imageUrl, height: 200),
            type: SimpleCardContainerType.outlined,
          ),
          SimpleCard(
            dense: false,
            onTap: () {},
            margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
            headline: const SimpleText('This is a card'),
            subhead: sampleText,
            supportingText: 'sampleText',
            image: SimpleImage(imageUrl, height: 200),
            type: SimpleCardContainerType.outlined,
          ),
          const SizedBox(height: SimpleConstants.xlg),
          const SimpleSegmentedButton(
            isSelected: [true, false, false],
            children: [
              SimpleText('Songs'),
              SimpleText('Albums'),
              SimpleText('Playlists'),
            ],
          ),
          const SizedBox(height: SimpleConstants.sm),
          const SimpleSegmentedButton(
            isSelected: [true, false, false],
            children: [
              Icon(Icons.wb_cloudy),
              Icon(Icons.wb_twilight),
              Icon(Icons.wb_sunny),
            ],
          ),
          const SizedBox(height: SimpleConstants.sm),
          Row(
            children: const [
              SimpleSegmentedButton(
                vertical: true,
                isSelected: [true, false, false],
                children: [
                  SimpleText('Songs'),
                  SimpleText('Albums'),
                  SimpleText('Playlists'),
                ],
              ),
              SizedBox(width: SimpleConstants.sm),
              SimpleSegmentedButton(
                vertical: true,
                multiSelect: true,
                isSelected: [true, true, false],
                children: [
                  Icon(Icons.wb_cloudy),
                  Icon(Icons.wb_twilight),
                  Icon(Icons.wb_sunny),
                ],
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.sm),
          SimpleUserCard(
            dense: false,
            onTap: () {},
            height: 450,
            headline: const SimpleText('Massimo Del Pezzo'),
            supportingText: sampleText,
            imageUrl: imageUrl,
            subhead: sampleText,
            type: SimpleCardContainerType.elevated,
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
        ],
      ),
    );
  }
}
