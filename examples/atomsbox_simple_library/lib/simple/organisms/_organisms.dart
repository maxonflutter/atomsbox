part of '../simple_preview_screen.dart';

class _Organisms extends StatelessWidget {
  const _Organisms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cards = const [
      SimpleCard(
        height: 150,
        imageUrl:
            'https://images.unsplash.com/photo-1678225758637-c176c3885aac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
        title: 'This is card #1',
        tagline: 'This is a tagline',
      ),
      SimpleCard(
        height: 150,
        imageUrl:
            'https://images.unsplash.com/photo-1678225758637-c176c3885aac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
        title: 'This is card #2',
        tagline: 'This is a tagline',
      ),
      SimpleCard(
        height: 150,
        imageUrl:
            'https://images.unsplash.com/photo-1678225758637-c176c3885aac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
        title: 'This is card #3',
        tagline: 'This is a tagline',
      )
    ];

    var listTiles = [
      SimpleListTile(
        onTap: () {},
        title: 'This is a title for the list item #1',
        tagline: 'This is a tagline',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
        leading: const SimpleImage(
          width: 100,
          height: 100,
          imageUrl:
              'https://images.unsplash.com/photo-1678225758637-c176c3885aac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
        ),
      ),
      SimpleListTile(
        onTap: () {},
        title: 'This is a title for the list item #2',
        tagline: 'This is a tagline',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
        leading: const SimpleImage(
          width: 100,
          height: 100,
          imageUrl:
              'https://images.unsplash.com/photo-1678225758637-c176c3885aac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
        ),
      ),
      SimpleListTile(
        onTap: () {},
        title: 'This is a title for the list item #3',
        tagline: 'This is a tagline',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
        leading: const SimpleImage(
          width: 100,
          height: 100,
          imageUrl:
              'https://images.unsplash.com/photo-1678225758637-c176c3885aac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SimpleText('A simple bottom nav bar'),
            const SizedBox(height: 4.0),
            SimpleBottomNavBar(
              items: [
                SimpleIconButton(
                  icon: Icons.home,
                  onPressed: () {},
                ),
                SimpleIconButton(
                  icon: Icons.home,
                  colorPalette: ColorPalette.primaryContainer,
                  onPressed: () {},
                ),
                SimpleIconButton(
                  icon: Icons.home,
                  colorPalette: ColorPalette.primaryContainer,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const SimpleText('A simple drawer'),
            const SizedBox(height: 4.0),
            Row(
              children: [
                SimpleIconButton(
                  icon: Icons.menu,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                const SizedBox(width: 8.0),
                const SimpleText('Click to open the drawer'),
              ],
            ),
            const SizedBox(height: 16.0),
            const SimpleText('A carousel of cards'),
            const SizedBox(height: 4.0),
            SimpleCarousel(carouselItems: cards),
            const SizedBox(height: 16.0),
            const SimpleText('A list of list tiles'),
            const SizedBox(height: 4.0),
            SimpleList(listItems: listTiles),
            const SizedBox(height: 16.0),
            const SimpleText('A list of cards'),
            const SizedBox(height: 4.0),
            SimpleList(listItems: cards),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
