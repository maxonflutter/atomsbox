import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'atoms/simple_button_example.dart';
import 'atoms/simple_chip_example.dart';
import 'atoms/simple_gradient_container.dart';
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

part 'atoms/_atoms.dart';
part 'molecules/_molecules.dart';
part 'organisms/_organisms.dart';

class SimplePreviewScreen extends StatelessWidget {
  const SimplePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple',
      theme: simpleAppTheme(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: SimpleDrawer(
            drawerItems: [
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
              ),
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
              ),
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
              ),
            ],
            drawerSecondaryItems: [
              SimpleListTile(
                onTap: () {},
                title: 'A secondary drawer item',
                leading: const Icon(Icons.settings),
              ),
            ],
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const SimpleText(
              'simple',
              textStyle: TextStyleEnum.headlineMedium,
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: SimpleText(
                    'Molecules',
                    textStyle: TextStyleEnum.bodySmall,
                    maxLines: 1,
                  ),
                ),
                Tab(
                  icon: SimpleText(
                    'Atoms',
                    textStyle: TextStyleEnum.bodySmall,
                    maxLines: 1,
                  ),
                ),
                Tab(
                  icon: SimpleText(
                    'Organisms',
                    textStyle: TextStyleEnum.bodySmall,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              _Molecules(),
              _Atoms(),
              _Organisms(),
            ],
          ),
        ),
      ),
    );
  }
}
