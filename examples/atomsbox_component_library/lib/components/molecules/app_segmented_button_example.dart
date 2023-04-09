import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../main.dart';

class AppSegmentedButtonExample extends StatelessWidget {
  const AppSegmentedButtonExample({super.key});

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
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(AppConstants.sm),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSegmentedButton(
                isSelected: const [true, false, false],
                children: [
                  AppText('Songs'),
                  AppText('Albums'),
                  AppText('Playlists'),
                ],
              ),
              const SizedBox(height: AppConstants.sm),
              const AppSegmentedButton(
                isSelected: [true, false, false],
                children: [
                  Icon(Icons.wb_cloudy),
                  Icon(Icons.wb_twilight),
                  Icon(Icons.wb_sunny),
                ],
              ),
              const SizedBox(height: AppConstants.sm),
              Row(
                children: [
                  AppSegmentedButton(
                    vertical: true,
                    isSelected: const [true, false, false],
                    children: [
                      AppText('Songs'),
                      AppText('Albums'),
                      AppText('Playlists'),
                    ],
                  ),
                  const SizedBox(width: AppConstants.sm),
                  const AppSegmentedButton(
                    vertical: true,
                    multiSelect: true,
                    isSelected: [true, true, false],
                    children: [
                      Icon(Icons.wb_cloudy),
                      Icon(Icons.wb_twilight),
                      Icon(Icons.wb_sunny),
                    ],
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
