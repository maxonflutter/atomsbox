import 'package:flutter/material.dart';

import '../atoms/app_icon_button.dart';
import '../atoms/config/app_constants.dart';

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

class AppAudioControls extends StatelessWidget {
  const AppAudioControls({
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
