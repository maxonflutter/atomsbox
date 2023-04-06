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
          SimpleList.vertical(
            title: const SimpleText('This is a vertical list'),
            description: const SimpleText(
              'This is a vertical list description',
            ),
            listItems: [1, 2, 3]
                .map(
                  (e) => SimpleListTile(
                    onTap: () {},
                    leading: SimpleImage(imageUrl, height: 48),
                    title: const SimpleText('This is a list tile'),
                    subtitle: const SimpleText(sampleText),
                    trailing: Row(
                      children: [
                        SimpleIconButton(
                          onPressed: () {},
                          child: const Icon(Icons.remove),
                        ),
                        SimpleIconButton(
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleList.horizontal(
            height: 100,
            title: const SimpleText('This is a horizontal list'),
            description: const SimpleText('This is a  list description'),
            listItems: [1, 2, 3]
                .map(
                  (e) => SimpleListTile(
                    onTap: () {},
                    width: 350,
                    leadingWidth: 96,
                    leading: SimpleImage(
                      imageUrl,
                      width: 96,
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
            height: 200,
            title: const SimpleText('This is a horizontal list'),
            description: const SimpleText('This is a  list description'),
            listItems: [1, 2, 3]
                .map(
                  (e) => SimpleCard(
                    onTap: () {},
                    height: 200,
                    width: 300,
                    margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
                    headline: const SimpleText('This is a card'),
                    subhead: sampleText,
                    supportingText: sampleText,
                    imageUrl: imageUrl,
                    type: SimpleCardContainerType.filled,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: SimpleConstants.xlg),
          SimpleGrid(
            title: const SimpleText('This is a grid'),
            description: const SimpleText('This is a  grid description'),
            itemHeight: 1,
            itemWidth: 1,
            crossAxisCount: 2,
            gridItems: [1, 2, 3]
                .map(
                  (e) => SimpleCard(
                    onTap: () {},
                    height: 200,
                    width: 300,
                    headline: const SimpleText('This is a card'),
                    subhead: sampleText,
                    supportingText: sampleText,
                    imageUrl: imageUrl,
                    type: SimpleCardContainerType.filled,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
