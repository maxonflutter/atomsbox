import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppOutlinedButtonExample extends StatelessWidget {
  const AppOutlinedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppOutlinedButton(
          onPressed: () {},
          child: AppText('Button'),
        ),
        const SizedBox(height: AppConstants.sm),
        AppOutlinedButton.secondary(
          onPressed: () {},
          child: AppText('Button'),
        ),
        const SizedBox(height: AppConstants.sm),
        AppOutlinedButton.gradient(
          onPressed: () {},
          child: AppText('Button'),
        ),
        const SizedBox(height: AppConstants.sm),
        // To be displayed on top of a background image.
        AppOutlinedButton.glass(
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
