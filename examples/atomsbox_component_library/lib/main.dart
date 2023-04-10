import 'package:atomsbox/atomsbox.dart';
import 'package:atomsbox_component_library/components/organisms/app_form_example.dart';
import 'package:atomsbox_component_library/components/organisms/app_list_example.dart';
import 'package:flutter/material.dart';

import 'components/atoms/app_card_example.dart';
import 'components/atoms/app_elevated_button_example.dart';
import 'components/atoms/app_filled_button_example.dart';
import 'components/atoms/app_icon_button_example.dart';
import 'components/atoms/app_image_example.dart';
import 'components/atoms/app_outlined_button_example.dart';
import 'components/atoms/app_slider_example.dart';
import 'components/atoms/app_text_button_example.dart';
import 'components/atoms/app_text_example.dart';
import 'components/atoms/app_text_form_field_example.dart';
import 'components/atoms/app_text_gradient_example.dart';
import 'components/molecules/app_default_card_example.dart';
import 'components/molecules/app_expansion_tile_example.dart';
import 'components/molecules/app_list_tile_example.dart';
import 'components/molecules/app_search_with_autocomplete_example.dart';
import 'components/molecules/app_segmented_button_example.dart';
import 'components/molecules/app_user_card_example.dart';
import 'components/organisms/app_audio_card_example.dart';
import 'components/organisms/app_grid_example.dart';
import 'components/organisms/app_tab_example.dart';

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
          theme: AppTheme.theme.copyWith(appBarTheme: AppBarTheme()),
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,
          home: AtomsboxExamples(),
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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppConstants.xlg),
                AppText.headlineLarge('Organisms'),
                const SizedBox(height: AppConstants.sm),
                AppFilledButton.gradient(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppAudioCard'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.gradient(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppForm'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.gradient(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppGrid'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.gradient(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppList'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.gradient(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppTab'),
                ),
                const SizedBox(height: AppConstants.xlg),
                AppText.headlineLarge('Molecules'),
                const SizedBox(height: AppConstants.sm),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 48),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AppDefaultCardExample();
                        },
                      ),
                    );
                  },
                  child: AppText('AppDefaultCard'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppExpansionTile'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppListTile'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 48),
                  onPressed: () {},
                  child: AppText('AppProductCard'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppSearchWithAuto'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppSegmentedButton'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppUserCard'),
                ),
                const SizedBox(height: AppConstants.xlg),
                AppText.headlineLarge('Atoms'),
                const SizedBox(height: AppConstants.sm),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppCard'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppElevatedButton'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppFilledButton'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppIconButton'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppImage'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppOutlinedButton'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppSlider'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppTextButton'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppText'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppTextFormField'),
                ),
                const SizedBox(height: AppConstants.sm * 0.5),
                AppFilledButton(
                  minimumSize: const Size(200, 48),
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
                  child: AppText('AppTextGradient'),
                ),
              ],
            ),
          ),
        ));
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
