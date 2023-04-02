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
            home: const AtomsboxComponents(),
          );
        });
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
