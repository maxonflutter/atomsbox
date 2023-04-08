import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_image.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import '../atoms/config/app_typedef.dart';
import '../molecules/app_audio_controls.dart';
import '../molecules/app_audio_seekbar.dart';
import '../molecules/app_list_tile.dart';

class AppAudioCard extends StatelessWidget {
  AppAudioCard({
    super.key,
    this.imageUrl,
    this.songUrl,
    this.songName,
    this.artistName,
    required this.seekbar,
    required this.audioControls,
  }) {
    builder = (context) {
      return AppCard.elevated(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppConstants.borderRadius,
                  ),
                  child: AppImage.network(imageUrl!),
                ),
              const SizedBox(height: AppConstants.sm),
              AppText.bodyLarge(songName ?? ''),
              AppText.bodySmall(artistName ?? ''),
              const SizedBox(height: AppConstants.sm),
              seekbar,
              audioControls,
            ],
          ),
        ),
      );
    };
  }

  AppAudioCard.dense({
    super.key,
    this.imageUrl,
    this.songUrl,
    this.songName,
    this.artistName,
    required this.seekbar,
    required this.audioControls,
  }) {
    builder = (context) {
      return AppCard.elevated(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.sm),
          child: Column(
            children: [
              AppListTile(
                leadingWidth: 48,
                leading: AppImage.network(imageUrl!, height: 48),
                title: AppText.bodyLarge(songName ?? ''),
                subtitle: AppText.bodySmall(artistName ?? ''),
                trailing: audioControls,
              ),
              seekbar,
            ],
          ),
        ),
      );
    };
  }

  late AppAudioCardBuilder builder;
  final String? imageUrl;
  final String? songUrl;
  final String? songName;
  final String? artistName;
  final AppAudioSeekbar seekbar;
  final AppAudioControls audioControls;

  @override
  Widget build(BuildContext context) {
    final audioCard = builder.call(context);
    return audioCard;
  }
}
