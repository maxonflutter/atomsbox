import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'simple/atoms/_atoms.dart';
part 'simple/molecules/_molecules.dart';
part 'simple/organisms/_organisms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Using "static" so that we can easily access it later
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            theme: SimpleTheme.theme,
            darkTheme: SimpleTheme.darkTheme,
            themeMode: currentMode,
            home: const MyCard(),
          );
        });
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

class AtomsboxComponents extends StatelessWidget {
  const AtomsboxComponents({super.key});

  @override
  Widget build(BuildContext context) {
    List<SimpleListTile> items = [1, 2, 3, 4]
        .map(
          (e) => SimpleListTile(
            // leading: SimpleImage(
            //   imageUrl,
            //   width: 80,
            //   height: 80,
            // ),
            title: const SimpleText(
              'This is a list tile',
              textStyle: SimpleTextStyle.bodyLarge,
              fontWeight: FontWeight.bold,
            ),
            subtitle: const SimpleText('sampleText', maxLines: 3),
          ),
        )
        .toList();
    return Scaffold(
      // drawer: SimpleDrawer(
      //   drawerItems: [1, 2, 3, 4].map((e) {
      //     return SimpleListTile(
      //       onTap: () {},
      //       leading: const Icon(Icons.offline_bolt),
      //       title: SimpleText(
      //         'Navigation Item #$e',
      //         textStyle: SimpleTextStyle.bodyLarge,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     );
      //   }).toList(),
      // ),
      appBar: AppBar(
        title: const Text('atomsbox'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              },
              icon: const Icon(Icons.light_mode),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(SimpleConstants.sm),
        child: Column(
          children: [
            SimpleTab(
              tabBarChildren: [
                Tab(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [Icon(Icons.code), SimpleText('Atoms')],
                  ),
                ),
                Tab(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [Icon(Icons.code), SimpleText('Molecules')],
                  ),
                ),
                Tab(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [Icon(Icons.code), SimpleText('Organisms')],
                  ),
                ),
              ],
              tabBarViewChildren: const [_Atoms(), _Molecules(), _Organisms()],
            ),
          ],
        ),
      ),
    );
  }
}
