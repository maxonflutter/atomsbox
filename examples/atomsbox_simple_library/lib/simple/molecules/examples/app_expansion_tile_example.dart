import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppExpansionTileExample extends StatelessWidget {
  const AppExpansionTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppExpansionTile(
            title: AppText('This is an expansion tile'),
            children: [
              AppText(sampleText),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          AppExpansionTile.secondary(
            title: AppText('This is an expansion tile'),
            children: [
              AppText(sampleText),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          AppExpansionTile.gradient(
            title: AppText('This is an expansion tile'),
            children: [
              AppText(sampleText),
            ],
          ),
        ],
      ),
    );
  }
}
