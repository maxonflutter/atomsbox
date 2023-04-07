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
            theme: AppTheme.theme,
            darkTheme: AppTheme.darkTheme,
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
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.sm),
          child: SimpleTab(
            tabs: [
              Tab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.code), AppText('Atoms')],
                ),
              ),
              Tab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.code), AppText('Molecules')],
                ),
              ),
              Tab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Icon(Icons.code), AppText('Organisms')],
                ),
              ),
            ],
            children: const [
              _Atoms(),
              _Molecules(),
              _Organisms(),
            ],
          ),
        ),
      ),
    );
  }
}
