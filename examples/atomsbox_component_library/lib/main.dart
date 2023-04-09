import 'package:atomsbox/atomsbox.dart';
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
                AppText.headlineLarge('Molecules'),
                const SizedBox(height: AppConstants.sm),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 45),
                  onPressed: () {},
                  child: AppText('AppProductCard'),
                ),
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton.secondary(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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
                AppFilledButton(
                  minimumSize: const Size(200, 45),
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







// class AtomsboxComponents extends StatelessWidget {
//   const AtomsboxComponents({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: AppDrawer(
//         title: AppText.headlineMedium(AppConstants.appName),
//         drawerItems: [
//           AppListTile(
//             onTap: () {},
//             title: AppText('Drawer Item #1'),
//           ),
//           AppListTile(
//             onTap: () {},
//             title: AppText('Drawer Item #2'),
//           ),
//         ],
//       ),
//       bottomNavigationBar: AppBottomNavBar(items: [
//         AppIconButton(
//           onPressed: () {},
//           child: const Icon(Icons.home),
//         ),
//         AppIconButton(
//           onPressed: () {},
//           child: const Icon(Icons.library_add),
//         ),
//         AppIconButton(
//           onPressed: () {},
//           child: const Icon(Icons.people),
//         ),
//       ]),
//       appBar: AppBar(
//         title: const Text('atomsbox'),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 4.0),
//             child: IconButton(
//               onPressed: () {
//                 MyApp.themeNotifier.value =
//                     MyApp.themeNotifier.value == ThemeMode.light
//                         ? ThemeMode.dark
//                         : ThemeMode.light;
//               },
//               icon: const Icon(Icons.light_mode),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(AppConstants.sm),
//           child: AppTab(
//             tabs: [
//               Tab(
//                 icon: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [Icon(Icons.code), AppText('Atoms')],
//                 ),
//               ),
//               Tab(
//                 icon: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [Icon(Icons.code), AppText('Molecules')],
//                 ),
//               ),
//               Tab(
//                 icon: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [Icon(Icons.code), AppText('Organisms')],
//                 ),
//               ),
//             ],
//             children: const [
//               _Atoms(),
//               _Molecules(),
//               _Organisms(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
