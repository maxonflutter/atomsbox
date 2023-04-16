import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
          child: AppTab(
            tabs: [
              Tab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Icon(Icons.code), AppText('Example #1')],
                ),
              ),
              Tab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Icon(Icons.code), AppText('Example #2')],
                ),
              ),
              Tab(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [const Icon(Icons.code), AppText('Example #3')],
                ),
              ),
            ],
            children: const [
              AppFormExample(),
              AppExpansionTileExample(),
              AppGridExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppFormExample extends StatelessWidget {
  const AppFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppForm(
            title: AppText('This is a form'),
            description: AppText('This is a form description'),
            formButton: AppFilledButton.gradient(
              onPressed: () {},
              child: AppText('Submit'),
            ),
            formItemNames: const ['One', 'Two', 'Three'],
            formItems: [
              AppTextFormField(),
              AppTextFormField(),
              AppTextFormField(),
            ],
          ),
        ],
      ),
    );
  }
}

class AppExpansionTileExample extends StatelessWidget {
  const AppExpansionTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppExpansionTile(
            title: AppText('This is an expansion tile'),
            children: [
              AppText(sampleText),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          AppExpansionTile.secondary(
            title: AppText('This is an expansion tile'),
            children: [
              AppText(sampleText),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          AppExpansionTile.gradient(
            title: AppText('This is an expansion tile'),
            children: [
              AppText(sampleText),
            ],
          ),
        ],
      ),
    );
  }
}

class AppGridExample extends StatelessWidget {
  const AppGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppGrid(
            title: AppText('This is a grid'),
            description: AppText('This is a description'),
            gridSettings: const AppGridSettings(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            gridItems: [1, 2, 3, 4]
                .map(
                  (e) => AppUserCard(
                    type: AppCardType.outlined,
                    onTap: () {},
                    imageUrl: imageUrl,
                    headline: AppText.bodyLarge('Max on Flutter', maxLines: 1),
                    supportingText: 'Supporting text',
                    actions: AppFilledButton(
                      onPressed: () {},
                      child: AppText('Add'),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppConstants.xlg),
          LayoutBuilder(
            builder: (context, constraints) {
              const gridItems = [1, 2, 3, 4, 5, 6];
              const crossAxisCount = 2;
              const gridItemHeight = 48;
              const horizontalSpacing = AppConstants.sm * (crossAxisCount + 1);
              const verticalSpacing = AppConstants.sm * (crossAxisCount + 1);

              return AppGrid(
                title: AppText('This is a grid'),
                description: AppText('This is a description'),
                height: gridItemHeight * (gridItems.length / crossAxisCount) +
                    verticalSpacing,
                gridSettings: AppGridSettings(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: (constraints.maxWidth - horizontalSpacing) /
                      crossAxisCount /
                      gridItemHeight,
                ),
                gridItems: gridItems
                    .map(
                      (e) => AppListTile(
                        onTap: () {},
                        leadingWidth: 48,
                        leading: AppImage.network(imageUrl, height: 48),
                        title: AppText.bodySmall(
                          'This is a list tile',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
