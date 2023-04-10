import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppTextButtonExample extends StatelessWidget {
  const AppTextButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                onPressed: () {},
                child: AppText('Button'),
              ),
              const SizedBox(height: AppConstants.sm),
              AppTextButton.secondary(
                onPressed: () {},
                child: AppText('Button'),
              ),
              const SizedBox(height: AppConstants.sm),
              AppTextButton.gradient(
                onPressed: () {},
                child: AppText('Button'),
              ),
              const SizedBox(height: AppConstants.sm),
              // To be displayed on top of a background image.
              AppTextButton.glass(
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
