import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppSegmentedButtonExample extends StatelessWidget {
  const AppSegmentedButtonExample({super.key});

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
          AppSegmentedButton(
            isSelected: const [true, false, false],
            children: [
              AppText('Songs'),
              AppText('Albums'),
              AppText('Playlists'),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          const AppSegmentedButton(
            isSelected: [true, false, false],
            children: [
              Icon(Icons.wb_cloudy),
              Icon(Icons.wb_twilight),
              Icon(Icons.wb_sunny),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          Row(
            children: [
              AppSegmentedButton(
                vertical: true,
                isSelected: const [true, false, false],
                children: [
                  AppText('Songs'),
                  AppText('Albums'),
                  AppText('Playlists'),
                ],
              ),
              const SizedBox(width: AppConstants.sm),
              const AppSegmentedButton(
                vertical: true,
                multiSelect: true,
                isSelected: [true, true, false],
                children: [
                  Icon(Icons.wb_cloudy),
                  Icon(Icons.wb_twilight),
                  Icon(Icons.wb_sunny),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
