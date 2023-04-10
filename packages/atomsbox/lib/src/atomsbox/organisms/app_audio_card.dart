import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_icon_button.dart';
import '../atoms/app_image.dart';
import '../atoms/app_slider.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import '../atoms/config/app_typedef.dart';
import '../atoms/extensions/duration_extensions.dart';
import '../molecules/app_list_tile.dart';

enum AudioPlayerState {
  /// The audio player is stopped.
  stopped,

  /// The audio player is playing.
  playing,

  /// The audio player is paused.
  paused,

  /// The audio player is loading.
  loading,

  /// The audio player is buffering.
  buffering,

  /// The audio player is completed.
  completed,

  /// The audio player is error.
  error,
}

class AppAudioCard extends StatelessWidget {
  AppAudioCard({
    super.key,
    this.imageUrl,
    this.songUrl,
    this.songName,
    this.artistName,
    // Audio Controls properties
    required this.play,
    required this.pause,
    required this.audioPlayerState,
    // Seekbar properties
    required this.position,
    required this.duration,
    this.onChanged,
    this.showDuration = true,
    this.showPosition = true,
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
              _AppAudioControls(
                audioPlayerState: audioPlayerState,
                play: play,
                pause: pause,
              ),
              _AppAudioSeekbar(
                position: position,
                duration: duration,
                showDuration: showDuration,
                showPosition: showPosition,
              ),
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
    // Audio Controls properties
    required this.play,
    required this.pause,
    required this.audioPlayerState,
    // Seekbar properties
    required this.position,
    required this.duration,
    this.onChanged,
    this.showDuration = false,
    this.showPosition = false,
  }) {
    builder = (context) {
      return AppCard.elevated(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppListTile(
              leadingWidth: 48,
              leading: AppImage.network(imageUrl!, height: 48),
              title: AppText.bodyLarge(songName ?? ''),
              subtitle: AppText.bodySmall(artistName ?? ''),
              trailing: _AppAudioControls(
                audioPlayerState: audioPlayerState,
                play: play,
                pause: pause,
              ),
            ),
            _AppAudioSeekbar(
              position: position,
              duration: duration,
              showDuration: showDuration,
              showPosition: showPosition,
            ),
          ],
        ),
      );
    };
  }

  late AudioCardBuilder builder;
  final String? imageUrl;
  final String? songUrl;
  final String? songName;
  final String? artistName;
  final VoidCallback play;
  final VoidCallback pause;
  final AudioPlayerState audioPlayerState;
  final Duration position;
  final Duration duration;
  final Function(double)? onChanged;
  final bool showDuration;
  final bool showPosition;

  @override
  Widget build(BuildContext context) {
    final audioCard = builder.call(context);
    return audioCard;
  }
}

class _AppAudioSeekbar extends StatelessWidget {
  const _AppAudioSeekbar({
    super.key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.showDuration = false,
    this.showPosition = false,
  });

  final Duration position;
  final Duration duration;
  final Function(double)? onChanged;
  final bool showDuration;
  final bool showPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSlider(
          height: AppConstants.sm,
          value: position.inMilliseconds.toDouble(),
          maxValue: duration.inMilliseconds.toDouble(),
          thumbShape: SliderComponentShape.noThumb,
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showPosition)
              AppText.bodySmall('-${(duration - position).formatDuration()}'),
            if (showDuration) AppText.bodySmall(position.formatDuration()),
          ],
        ),
      ],
    );
  }
}

class _AppAudioControls extends StatelessWidget {
  const _AppAudioControls({
    Key? key,
    this.iconSize = 50,
    required this.play,
    required this.pause,
    required this.audioPlayerState,
    this.showSecondaryButtons = false,
  }) : super(key: key);

  final double iconSize;
  final VoidCallback play;
  final VoidCallback pause;
  final AudioPlayerState audioPlayerState;
  final bool showSecondaryButtons;

  @override
  Widget build(BuildContext context) {
    Widget primaryButton;

    switch (audioPlayerState) {
      case AudioPlayerState.buffering:
        primaryButton = Container(
          padding: const EdgeInsets.all(AppConstants.sm),
          width: 48,
          height: 48,
          child: const CircularProgressIndicator(),
        );
        break;
      case AudioPlayerState.loading:
        primaryButton = Container(
          padding: const EdgeInsets.all(AppConstants.sm),
          width: 48,
          height: 48,
          child: const CircularProgressIndicator(),
        );
        break;
      case AudioPlayerState.paused:
        primaryButton = AppIconButton(
          onPressed: play,
          child: const Icon(Icons.play_arrow),
        );
        break;
      case AudioPlayerState.playing:
        primaryButton = AppIconButton(
          onPressed: pause,
          child: const Icon(Icons.pause),
        );
        break;
      default:
        primaryButton = AppIconButton(
          onPressed: () {},
          child: const Icon(Icons.replay),
        );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showSecondaryButtons)
          AppIconButton(
            onPressed: () {},
            child: const Icon(Icons.skip_previous),
          ),
        const SizedBox(width: AppConstants.sm),
        primaryButton,
        const SizedBox(width: AppConstants.sm),
        if (showSecondaryButtons)
          AppIconButton(
            onPressed: () {},
            child: const Icon(Icons.skip_next),
          ),
      ],
    );
  }
}
