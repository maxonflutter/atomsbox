import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppTextExample extends StatelessWidget {
  const AppTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.displayLarge('This is text'),
        AppText.displayMedium('This is text'),
        AppText.displaySmall('This is text'),
        AppText.headlineLarge('This is text', letterSpacing: 1.5),
        AppText.headlineMedium('This is text', letterSpacing: 1.5),
        AppText.headlineSmall('This is text', letterSpacing: 1.5),
        AppText.titleLarge('This is text', fontWeight: FontWeight.bold),
        AppText.titleMedium('This is text', fontWeight: FontWeight.bold),
        AppText.titleSmall('This is text', fontWeight: FontWeight.bold),
        AppText.bodyLarge('This is text'),
        AppText.bodyMedium('This is text'),
        AppText.bodySmall('This is text'),
      ],
    );
  }
}
