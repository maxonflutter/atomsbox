import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppFilledButtonExample extends StatelessWidget {
  const AppFilledButtonExample({super.key});

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
              AppFilledButton(
                onPressed: () {},
                child: AppText('Button'),
              ),
              const SizedBox(height: AppConstants.sm),
              AppFilledButton.secondary(
                onPressed: () {},
                child: AppText('Button'),
              ),
              const SizedBox(height: AppConstants.sm),
              AppFilledButton.gradient(
                onPressed: () {},
                child: AppText('Button'),
              ),
              const SizedBox(height: AppConstants.sm),
              // To be displayed on top of a background image.
              AppFilledButton.glass(
                onPressed: () {},
                child: AppText(
                  'Button',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
