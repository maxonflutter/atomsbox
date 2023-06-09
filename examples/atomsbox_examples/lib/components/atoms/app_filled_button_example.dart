import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppFilledButtonExample extends StatelessWidget {
  const AppFilledButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
