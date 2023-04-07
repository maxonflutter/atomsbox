part of '../../main.dart';

class _Organisms extends StatelessWidget {
  const _Organisms();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    const sampleText = [
      'Lorem ipsum dolor sit amet',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ];

    double gridWidth = size.width - AppConstants.sm * 3;
    double gridHeight = 48 * 3 + AppConstants.sm * 2;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: AppConstants.xlg),
          AppGrid(
            title: AppText('This is a grid'),
            description: AppText('This is a description'),
            crossAxisCount: 2,
            height: gridHeight,
            // (Screen width - left/right padding - cross axis spacing) divided by cross axis count divided by grid item height
            childAspectRatio: gridWidth / 2 / 48,
            gridItems: [1, 2, 3, 4, 5, 6]
                .map(
                  (e) => AppListTile(
                    onTap: () {},
                    leadingWidth: 48,
                    leading: AppImage.network(imageUrl, height: 48),
                    title: AppText.bodySmall(
                      'This is a list tile',
                      fontWeight: FontWeight.bold,
                    ),
                    // subtitle: AppText(sampleText[0], maxLines: 3),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppConstants.xlg),
          AppList.horizontal(
            title: AppText('This is a horizontal list'),
            description: AppText('This is a  list description'),
            listItems: [1, 2, 3]
                .map(
                  (e) => DefaultCard(
                    width: 300,
                    onTap: () {},
                    margin: const EdgeInsets.only(bottom: AppConstants.sm),
                    headline: AppText('This is a card'),
                    subhead: sampleText[e.isEven ? 0 : 1],
                    supportingText: sampleText[e.isEven ? 0 : 1],
                    image: AppImage.network(imageUrl, height: 200),
                  ),
                )
                .toList(),
          ),
          AppList.horizontal(
            title: AppText('This is a horizontal list'),
            description: AppText('This is a  list description'),
            listItems: [1, 2, 3]
                .map(
                  (e) => AppListTile(
                    onTap: () {},
                    width: 350,
                    leadingWidth: 96,
                    leading: AppImage.network(imageUrl),
                    title: AppText.bodyLarge(
                      'This is a list tile',
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: AppText(sampleText[0], maxLines: 3),
                  ),
                )
                .toList(),
          ),

          // SimpleForm(
          //   title: AppText('This is a form'),
          //   description: AppText('This is a form description'),
          //   formButton: SimpleButton.elevated(
          //     onPressed: () {},
          //     child: AppText('Submit'),
          //   ),
          //   formItemNames: const ['One', 'Two', 'Three'],
          //   formItems: [
          // /AppTextFormField(),
          // /AppTextFormField(),
          // /AppTextFormField(),
          //   ],
          // ),
          // const SizedBox(height: AppConstants.xlg),
          // AppList.vertical(
          //   title: AppText('This is a vertical list'),
          //   description: AppText(
          //     'This is a vertical list description',
          //   ),
          //   listItems: [1, 2, 3]
          //       .map(
          //         (e) => AppListTile(
          //           onTap: () {},
          //           leading: AppImage.network(imageUrl, height: 48),
          //           title: AppText('This is a list tile'),
          //           subtitle: AppText(sampleText),
          //           trailing: Row(
          //             children: [
          //               SimpleIconButton(
          //                 onPressed: () {},
          //                 child: const Icon(Icons.remove),
          //               ),
          //               SimpleIconButton(
          //                 onPressed: () {},
          //                 child: const Icon(Icons.add),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )
          //       .toList(),
          // ),
          // const SizedBox(height: AppConstants.xlg),
          // AppList.horizontal(
          //   height: 100,
          //   title: AppText('This is a horizontal list'),
          //   description: AppText('This is a  list description'),
          //   listItems: [1, 2, 3]
          //       .map(
          //         (e) => AppListTile(
          //           onTap: () {},
          //           width: 350,
          //           leadingWidth: 96,
          //           leading: AppImage.network(
          //             imageUrl,
          //             width: 96,
          //           ),
          //           title: AppText(
          //             'This is a list tile',
          //             textSAppTextStyle.bodyLarge,
          //             fontWeight: FontWeight.bold,
          //           ),
          //           subtitle: AppText(sampleText, maxLines: 3),
          //         ),
          //       )
          //       .toList(),
          // ),
          // const SizedBox(height: AppConstants.xlg),
          // AppList.horizontal(
          //   height: 200,
          //   title: AppText('This is a horizontal list'),
          //   description: AppText('This is a list description'),
          //   listItems: [1, 2, 3]
          //       .map(
          //         (e) => SimpleCard(
          //           onTap: () {},
          //           height: 200,
          //           width: 300,
          //           margin: const EdgeInsets.only(bottom: AppConstants.sm),
          //           headline: AppText('This is a card'),
          //           subhead: sampleText,
          //           supportingText: sampleText,
          //           image: AppImage.network(imageUrl),
          //           type: AppCardContainerType.filled,
          //         ),
          //       )
          //       .toList(),
          // ),
          // const SizedBox(height: AppConstants.xlg),
          // SimpleGrid(
          //   title: AppText('This is a grid'),
          //   description: AppText('This is a  grid description'),
          //   itemHeight: 1,
          //   itemWidth: 1,
          //   crossAxisCount: 2,
          //   gridItems: [1, 2, 3, 4]
          //       .map(
          //         (e) => SimpleCard(
          //           dense: false,
          //           onTap: () {},
          //           headline: AppText(
          //             'This is a card with a long headline',
          //             fontWeight: FontWeight.bold,
          //             textSAppTextStyle.bodyLarge,
          //             maxLines: 2,
          //           ),
          //           image: AppImage.network(imageUrl, height: 100),
          //           type: AppCardContainerType.filled,
          //         ),
          //       )
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}
