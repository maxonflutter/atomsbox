import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppIconButtonExample extends StatelessWidget {
  const AppIconButtonExample({super.key});

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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIconButton(
                onPressed: () {},
                child: const Icon(Icons.offline_bolt),
              ),
              const SizedBox(height: AppConstants.sm),
              AppIconButton.secondary(
                onPressed: () {},
                child: const Icon(Icons.offline_bolt),
              ),
              const SizedBox(height: AppConstants.sm),
              AppIconButton.gradient(
                onPressed: () {},
                child: const Icon(Icons.offline_bolt),
              ),
              const SizedBox(height: AppConstants.sm),
              // To be displayed on top of a background image.
              AppIconButton.glass(
                onPressed: () {},
                child: const Icon(Icons.offline_bolt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
