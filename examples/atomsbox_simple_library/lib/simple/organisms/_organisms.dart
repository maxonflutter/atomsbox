part of '../../main.dart';

class _Organisms extends StatelessWidget {
  const _Organisms();

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: SimpleConstants.sm),
          SimpleList.vertical(
            title: 'This is a vertical list',
            listItems: [1, 2, 3]
                .map(
                  (e) => SimpleListTile(
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
                )
                .toList(),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleList.horizontal(
            height: 100,
            title: 'This is a horizontal list',
            listItems: [1, 2, 3]
                .map(
                  (e) => SimpleListTile(
                    width: 350,
                    onTap: () {},
                    leading: SimpleImage(
                      imageUrl,
                      width: 100,
                      height: 100,
                    ),
                    title: const SimpleText(
                      'This is a list tile',
                      textStyle: SimpleTextStyle.bodyLarge,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: const SimpleText(sampleText, maxLines: 3),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          // SimpleList.horizontal(
          //   height: 200,
          //   title: 'This is a horizontal list',
          //   listItems: [1, 2, 3]
          //       .map(
          //         (e) => SimpleCard(
          //           width: 350,
          //           imageUrl: imageUrl,
          //           onTap: () {},
          //           title: const SimpleText('This is a card'),
          //           subtitle: sampleText,
          //         ),
          //       )
          //       .toList(),
          // ),
          const SizedBox(height: SimpleConstants.xlg),
          // SimpleGrid(
          //   title: 'This is a grid',
          //   itemHeight: 1.25,
          //   itemWidth: 1,
          //   gridItems: [1, 2, 3]
          //       .map(
          //         (e) => SimpleCard(
          //           imageUrl: imageUrl,
          //           dense: false,
          //           onTap: () {},
          //           title: const SimpleText(
          //             'This is a card',
          //             maxLines: 2,
          //           ),
          //           paragraph: sampleText,
          //         ),
          //       )
          //       .toList(),
          // )
        ],
      ),
    );
  }
}
