import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppTextFormFieldExample extends StatelessWidget {
  const AppTextFormFieldExample({super.key});

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
          margin: const EdgeInsets.all(AppConstants.lg),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFormField(
                labelText: 'Underline',
              ),
              const SizedBox(height: AppConstants.sm),
              AppTextFormField.filled(
                labelText: 'Filled',
              ),
              const SizedBox(height: AppConstants.sm),
              AppTextFormField.outlined(
                labelText: 'Outlined',
              ),
              const SizedBox(height: AppConstants.sm),
              AppTextFormField.gradient(
                labelText: 'Gradient',
              ),
              const SizedBox(height: AppConstants.sm),
              // To be displayed on top of a background image.
              AppTextFormField.glass(
                labelText: 'Glass',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
