import 'package:atomsbox/atomsbox.dart';
import 'package:atomsbox_simple_library/simple/atoms/simple_gradient_container_example.dart';
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
import 'molecules/simple_audio_controls_example.dart';
import 'molecules/simple_audio_seekbar_example.dart';
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
part 'organisms/_organisms.dart';

class SimplePreviewScreen extends StatelessWidget {
  const SimplePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple',
      theme: SimpleTheme.theme,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: SimpleDrawer(
            drawerItems: [
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
                palette: Palette.primary,
              ),
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
                palette: Palette.primary,
              ),
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
                palette: Palette.primary,
              ),
            ],
            drawerSecondaryItems: [
              SimpleListTile(
                onTap: () {},
                title: 'A secondary drawer item',
                leading: const Icon(Icons.settings),
                palette: Palette.primary,
              ),
            ],
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const SimpleText(
              'simple',
              textStyle: TextStyleEnum.headlineMedium,
            ),
          ),
          body: SimpleTab(
            tabBarItemNames: const [
              'Atoms',
              // 'Molecules',
              // 'Organisms',
            ],
            tabBarItemIcons: const [
              Icons.home,
              // Icons.code,
              // Icons.people,
            ],
            tabBarViewChildren: const [
              _Atoms(),
              // _Molecules(),
              // _Organisms(),
            ],
          ),
        ),
      ),
    );
  }
}
