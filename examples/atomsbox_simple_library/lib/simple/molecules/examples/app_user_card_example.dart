import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppAppUserCardExample extends StatelessWidget {
  const AppAppUserCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppUserCard(
            type: AppCardType.filled,
            onTap: () {},
            height: 450,
            imageUrl: imageUrl,
            backgroundImageUrl: imageUrl,
            headline: AppText('Massimo Del Pezzo'),
            supportingText: sampleText,
            subhead: sampleText,
            actions: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                  onPressed: () {},
                  child: AppText('Add'),
                ),
                const SizedBox(width: AppConstants.sm),
                AppFilledButton(
                  onPressed: () {},
                  child: AppText('Follow'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.sm),
          AppUserCard(
            type: AppCardType.outlined,
            onTap: () {},
            height: 450,
            imageUrl: imageUrl,
            headline: AppText('Massimo Del Pezzo'),
            supportingText: sampleText,
            actions: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFilledButton(
                  onPressed: () {},
                  child: AppText('Add'),
                ),
                const SizedBox(width: AppConstants.sm),
                AppFilledButton(
                  onPressed: () {},
                  child: AppText('Follow'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
