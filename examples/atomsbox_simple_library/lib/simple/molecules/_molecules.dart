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
          const SizedBox(height: AppConstants.xlg),

          DefaultCard(
            onTap: () {},
            margin: const EdgeInsets.only(bottom: AppConstants.sm),
            headline: AppText('This is a card'),
            subhead: sampleText,
            supportingText: sampleText,
            image: AppImage.network(imageUrl, height: 200),
          ),
          DefaultCard(
            margin: const EdgeInsets.only(bottom: AppConstants.sm),
            headline: AppText('This is a card'),
            subhead: sampleText,
            supportingText: sampleText,
            // image: AppImage.network(imageUrl, height: 200),
            actions: [
              AppFilledButton(
                onPressed: () {},
                child: AppText('Action 1'),
              ),
              AppFilledButton(
                onPressed: () {},
                child: AppText('Action 2'),
              ),
            ],
          ),
          // SimpleListTile(
          //   onTap: () {},
          //   leading: const CircleAvatar(radius: 24),
          //   title: const AppText('This is a list tile'),
          //   subtitle: const AppText(sampleText),
          //   trailing: const Icon(Icons.offline_bolt),
          // ),
          // const SizedBox(height: AppConstants.sm),
          // SimpleListTile(
          //   onTap: () {},
          //   isThreeLine: true,
          //   leading: AppImage.network(imageUrl, height: 48),
          //   title: const AppText('This is a list tile'),
          //   subtitle: const AppText(sampleText),
          //   trailing: const Icon(Icons.offline_bolt),
          // ),
          // const SizedBox(height: AppConstants.sm),
          // SimpleListTile(
          //   onTap: () {},
          //   primary: true,
          //   isThreeLine: true,
          //   leadingWidth: 96,
          //   leading: AppImage.network(imageUrl, height: 96),
          //   title: const AppText('This is a list tile'),
          //   subtitle: const AppText(sampleText),
          //   trailing: const Icon(Icons.offline_bolt),
          // ),
          // const SizedBox(height: AppConstants.xlg),
          // SimpleExpansionTile(
          //   initiallyExpanded: true,
          //   title: const AppText('This is an expansion tile'),
          //   children: const [AppText(sampleText)],
          // ),
          // const SizedBox(height: AppConstants.sm),
          // SimpleExpansionTile(
          //   title: const AppText('This is an expansion tile'),
          //   children: const [AppText(sampleText)],
          // ),
          // const SizedBox(height: AppConstants.sm),
          // SimpleExpansionTile.transparent(
          //   title: const AppText('This is an expansion tile'),
          //   children: const [AppText(sampleText)],
          // ),
          // const SizedBox(height: AppConstants.xlg),
          // SimpleCard(
          //   onTap: () {},
          //   height: 200,
          //   margin: const EdgeInsets.only(bottom: AppConstants.sm),
          //   headline: const AppText('This is a card'),
          //   subhead: sampleText,
          //   supportingText: sampleText,
          //   image: AppImage.network(imageUrl),
          //   type: AppCardContainerType.filled,
          // ),

          // const SizedBox(height: AppConstants.xlg),
          // const SimpleSegmentedButton(
          //   isSelected: [true, false, false],
          //   children: [
          //     AppText('Songs'),
          //     AppText('Albums'),
          //     AppText('Playlists'),
          //   ],
          // ),
          // const SizedBox(height: AppConstants.sm),
          // const SimpleSegmentedButton(
          //   isSelected: [true, false, false],
          //   children: [
          //     Icon(Icons.wb_cloudy),
          //     Icon(Icons.wb_twilight),
          //     Icon(Icons.wb_sunny),
          //   ],
          // ),
          // const SizedBox(height: AppConstants.sm),
          // Row(
          //   children: const [
          //     SimpleSegmentedButton(
          //       vertical: true,
          //       isSelected: [true, false, false],
          //       children: [
          //         AppText('Songs'),
          //         AppText('Albums'),
          //         AppText('Playlists'),
          //       ],
          //     ),
          //     SizedBox(width: AppConstants.sm),
          //     SimpleSegmentedButton(
          //       vertical: true,
          //       multiSelect: true,
          //       isSelected: [true, true, false],
          //       children: [
          //         Icon(Icons.wb_cloudy),
          //         Icon(Icons.wb_twilight),
          //         Icon(Icons.wb_sunny),
          //       ],
          //     ),
          //   ],
          // ),
          // const SizedBox(height: AppConstants.sm),
          UserCard(
            dense: false,
            onTap: () {},
            height: 450,
            headline: AppText('Massimo Del Pezzo'),
            supportingText: sampleText,
            imageUrl: imageUrl,
            subhead: sampleText,
            type: AppCardContainerType.filled,
            actions: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                  onPressed: () {},
                  child: AppText('Add'),
                ),
                const SizedBox(width: AppConstants.sm),
                AppFilledButton(
                  onPressed: () {},
                  child: AppText('Follow'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
