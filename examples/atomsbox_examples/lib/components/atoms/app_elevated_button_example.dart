import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonExample extends StatelessWidget {
  const AppElevatedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppElevatedButton(
          onPressed: () {},
          child: AppText('Button'),
        ),
        const SizedBox(height: AppConstants.sm),
        AppElevatedButton.secondary(
          onPressed: () {},
          child: AppText('Button'),
        ),
        const SizedBox(height: AppConstants.sm),
        AppElevatedButton.gradient(
          onPressed: () {},
          child: AppText('Button'),
        ),
        const SizedBox(height: AppConstants.sm),
        // To be displayed on top of a background image.
        AppElevatedButton.glass(
          onPressed: () {},
          child: AppText(
            'Button',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
