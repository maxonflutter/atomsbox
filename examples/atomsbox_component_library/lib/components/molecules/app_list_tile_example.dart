import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppListTileExample extends StatelessWidget {
  const AppListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(AppConstants.sm),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppListTile(
                onTap: () {},
                leading: const CircleAvatar(radius: 24),
                title: AppText('This is a list tile'),
                subtitle: AppText(sampleText),
                trailing: const Icon(Icons.offline_bolt),
              ),
              const SizedBox(height: AppConstants.sm),
              AppListTile(
                onTap: () {},
                isThreeLine: true,
                leading: AppImage.network(imageUrl, height: 48),
                title: AppText('This is a list tile'),
                // subtitle: AppText(sampleText),
                trailing: Row(
                  children: [
                    AppIconButton(
                      onPressed: () {},
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: AppConstants.sm),
                    AppIconButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.sm),
              AppListTile(
                onTap: () {},
                isThreeLine: true,
                leadingWidth: 96,
                leading: AppImage.network(imageUrl, height: 96),
                title: AppText('This is a list tile'),
                subtitle: AppText(sampleText),
                // trailing: const Icon(Icons.offline_bolt),
              ),
              const SizedBox(height: AppConstants.sm),
              AppCard.gradient(
                child: AppListTile(
                  onTap: () {},
                  isThreeLine: true,
                  leadingWidth: 96,
                  leading: AppImage.network(imageUrl, height: 96),
                  title: AppText(
                    'This is a list tile',
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  subtitle: AppText(
                    sampleText,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  // trailing: const Icon(Icons.offline_bolt),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
