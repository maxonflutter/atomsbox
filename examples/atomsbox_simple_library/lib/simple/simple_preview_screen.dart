import 'package:atomsbox/atomsbox.dart';
import 'atoms/simple_gradient_container_example.dart';
import 'package:flutter/material.dart';

import 'atoms/simple_button_example.dart';
import 'atoms/simple_chip_example.dart';
import 'atoms/simple_icon_button_example.dart';
import 'atoms/simple_image_example.dart';
import 'atoms/simple_label_example.dart';
import 'atoms/simple_slider_example.dart';
import 'atoms/simple_text_example.dart';
import 'atoms/simple_text_form_field_example.dart';
import 'molecules/simple_accordion_example.dart';
import 'molecules/simple_card_example.dart';
import 'molecules/simple_form_example.dart';
import 'molecules/simple_list_tile_example.dart';
import 'molecules/simple_toggle_buttons_example.dart';
import 'organisms/simple_audio_player_example.dart';
import 'organisms/simple_bottom_nav_bar_example.dart';
import 'organisms/simple_carousel_example.dart';
import 'organisms/simple_drawer_example.dart';
import 'organisms/simple_grid_example.dart';
import 'organisms/simple_list_example.dart';

part 'atoms/_atoms.dart';
part 'molecules/_molecules.dart';
// part 'organisms/_organisms.dart';

class SimplePreviewScreen extends StatelessWidget {
  const SimplePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        title: SimpleText(
          'simple',
          textStyle: TextStyleEnum.headlineMedium,
        ),
        actions: [
          SimpleIconButton(
            icon: Icons.dark_mode,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimplePreviewDarkScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SimpleTab(
        tabBarItemNames: const [
          'Atoms',
          'Molecules',
          // 'Organisms',
        ],
        tabBarItemIcons: const [
          Icons.home,
          Icons.code,
          // Icons.people,
        ],
        tabBarViewChildren: const [
          _Atoms(),
          _Molecules(),
          // _Organisms(),
        ],
      ),
    );
  }
}

class SimplePreviewDarkScreen extends StatelessWidget {
  const SimplePreviewDarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: SimpleText(
          'simple',
          color: Theme.of(context).colorScheme.onPrimary,
          textStyle: TextStyleEnum.headlineMedium,
        ),
        actions: [
          SimpleIconButton(
            icon: Icons.light_mode,
            brightness: Brightness.dark,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimplePreviewScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SimpleTab(
        brightness: Brightness.dark,
        tabBarItemNames: const [
          'Atoms',
          'Molecules',
          // 'Organisms',
        ],
        tabBarItemIcons: const [
          Icons.home,
          Icons.code,
          // Icons.people,
        ],
        tabBarViewChildren: const [
          _AtomsDark(),
          _MoleculesDark(),
          // _OrganismsDark(),
        ],
      ),
    );
  }
}
