import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
      body: SingleChildScrollView(
        child: SimpleTab(
          tabs: [
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
          children: [
            Container(
              color: Colors.amber,
              child: Column(
                children: [
                  Text('First tab'),
                  Container(
                    height: 200,
                    child: Text('One'),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          color: Colors.red,
                          child: Text('One'),
                        );
                      }),
                ],
              ),
            ),
            Text('Second tab'),
            Text('Third tab'),
          ],
        ),
      ),
    );
  }
}
