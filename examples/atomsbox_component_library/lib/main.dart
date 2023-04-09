import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'atoms/examples/app_buttons_example.dart';
import 'atoms/examples/app_cards_example.dart';
import 'atoms/examples/app_image_example.dart';
import 'atoms/examples/app_slider_example.dart';
import 'atoms/examples/app_text_example.dart';
import 'atoms/examples/app_text_form_fields_example.dart';
import 'molecules/examples/app_default_card_example.dart';
import 'molecules/examples/app_expansion_tile_example.dart';
import 'molecules/examples/app_list_tile_example.dart';
import 'molecules/examples/app_segmented_button_example.dart';
import 'molecules/examples/app_user_card_example.dart';
import 'organisms/examples/app_form_example.dart';
import 'organisms/examples/app_grid_example.dart';
import 'organisms/examples/app_list_example.dart';

part 'atoms/_atoms.dart';
part 'molecules/_molecules.dart';
part 'organisms/_organisms.dart';

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
      },
    );
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
