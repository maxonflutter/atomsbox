import 'package:atomsbox/atomsbox.dart';
import 'package:atomsbox_component_library/components/molecules/app_countdown_example.dart';
import 'package:flutter/material.dart';

import 'components/atoms/app_card_example.dart';
import 'components/atoms/app_elevated_button_example.dart';
import 'components/atoms/app_filled_button_example.dart';
import 'components/atoms/app_icon_button_example.dart';
import 'components/atoms/app_image_example.dart';
import 'components/atoms/app_outlined_button_example.dart';
import 'components/molecules/app_rating_bar_example.dart';
import 'components/atoms/app_slider_example.dart';
import 'components/atoms/app_text_button_example.dart';
import 'components/atoms/app_text_example.dart';
import 'components/atoms/app_text_form_field_example.dart';
import 'components/atoms/app_text_gradient_example.dart';
import 'components/molecules/app_card_image_and_content_block_example.dart';
import 'components/molecules/app_expansion_tile_example.dart';
import 'components/molecules/app_list_tile_example.dart';
import 'components/molecules/app_search_with_autocomplete_example.dart';
import 'components/molecules/app_segmented_button_example.dart';
import 'components/molecules/app_user_card_example.dart';
import 'components/organisms/app_audio_card_example.dart';
import 'components/organisms/app_bottom_nav_bar_example.dart';
import 'components/organisms/app_data_table_example.dart';
import 'components/organisms/app_form_example.dart';
import 'components/organisms/app_grid_example.dart';
import 'components/organisms/app_list_example.dart';
import 'components/organisms/app_tab_example.dart';
import 'components/organisms/app_tree_view_example.dart';

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
          home: const AtomsboxExamples(),
        );
      },
    );
  }
}

class AtomsboxExamples extends StatelessWidget {
  const AtomsboxExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText('atomsbox'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppConstants.xlg),
              AppText.headlineLarge('Organisms'),
              const SizedBox(height: AppConstants.sm),
              Wrap(
                spacing: AppConstants.sm * 0.5,
                runSpacing: AppConstants.sm * 0.5,
                children: [
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppAudioCardExample();
                          },
                        ),
                      );
                    },
                    child: AppText('AudioCard'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppBottomNavBarExample();
                          },
                        ),
                      );
                    },
                    child: AppText('BottomNavBar'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppDataTableExample();
                          },
                        ),
                      );
                    },
                    child: AppText('DataTable'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppFormExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Form'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppGridExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Grid'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppListExample();
                          },
                        ),
                      );
                    },
                    child: AppText('List'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppTabExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Tab'),
                  ),
                  AppFilledButton.gradient(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppTreeViewExample();
                          },
                        ),
                      );
                    },
                    child: AppText('TreeView'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                ],
              ),
              const SizedBox(height: AppConstants.xlg),
              AppText.headlineLarge('Molecules'),
              const SizedBox(height: AppConstants.sm),
              Wrap(
                spacing: AppConstants.sm * 0.5,
                runSpacing: AppConstants.sm * 0.5,
                children: [
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppCardImageAndContentBlockExample();
                          },
                        ),
                      );
                    },
                    child: AppText('CardImageAndContentBlock'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppCountdownExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Countdown'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppExpansionTileExample();
                          },
                        ),
                      );
                    },
                    child: AppText('ExpansionTile'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppListTileExample();
                          },
                        ),
                      );
                    },
                    child: AppText('ListTile'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {},
                    child: AppText('ProductCard'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppSearchWithAutocompleteExample();
                          },
                        ),
                      );
                    },
                    child: AppText('SearchWithAuto'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppRatingBarExample();
                          },
                        ),
                      );
                    },
                    child: AppText('RatingBar'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppSegmentedButtonExample();
                          },
                        ),
                      );
                    },
                    child: AppText('SegmentedButton'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton.secondary(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppUserCardExample();
                          },
                        ),
                      );
                    },
                    child: AppText('UserCard'),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.xlg),
              AppText.headlineLarge('Atoms'),
              const SizedBox(height: AppConstants.sm),
              Wrap(
                spacing: AppConstants.sm * 0.5,
                runSpacing: AppConstants.sm * 0.5,
                children: [
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppCardExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Card'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppElevatedButtonExample();
                          },
                        ),
                      );
                    },
                    child: AppText('ElevatedButton'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppFilledButtonExample();
                          },
                        ),
                      );
                    },
                    child: AppText('FilledButton'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppIconButtonExample();
                          },
                        ),
                      );
                    },
                    child: AppText('IconButton'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppImageExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Image'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppOutlinedButtonExample();
                          },
                        ),
                      );
                    },
                    child: AppText('OutlinedButton'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppSliderExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Slider'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppTextButtonExample();
                          },
                        ),
                      );
                    },
                    child: AppText('TextButton'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppTextExample();
                          },
                        ),
                      );
                    },
                    child: AppText('Text'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppTextFormFieldExample();
                          },
                        ),
                      );
                    },
                    child: AppText('TextFormField'),
                  ),
                  const SizedBox(height: AppConstants.sm * 0.5),
                  AppFilledButton(
                    minimumSize: const Size(100, 48),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AppTextGradientExample();
                          },
                        ),
                      );
                    },
                    child: AppText('TextGradient'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleAppBar extends StatelessWidget with PreferredSizeWidget {
  const ExampleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Column(
        children: [
          AppIconButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      title: AppText('atomsbox'),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
