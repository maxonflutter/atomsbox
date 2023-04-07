import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppTextExample extends StatelessWidget {
  const AppTextExample({super.key});

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
          AppText.displayLarge('This is text'),
          AppText.displayMedium('This is text'),
          AppText.displaySmall('This is text'),
          AppText.headlineLarge('This is text'),
          AppText.headlineMedium('This is text'),
          AppText.headlineSmall('This is text'),
          AppText.titleLarge('This is text'),
          AppText.titleMedium('This is text'),
          AppText.titleSmall('This is text'),
          AppText.bodyLarge('This is text'),
          AppText.bodyMedium('This is text'),
          AppText.bodySmall('This is text'),
        ],
      ),
    );
  }
}
