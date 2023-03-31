import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/config/simple_palettes.dart';
import '../atoms/simple_icon_button.dart';

class SimpleAudioControls extends StatelessWidget {
  const SimpleAudioControls({
    Key? key,
    this.iconSize = 50,
    required this.play,
    required this.pause,
    this.playbackState,
    this.dense = false,
  }) : super(key: key);

  final double iconSize;

  final VoidCallback play;

  final VoidCallback pause;

  final PlaybackState? playbackState;

  final bool dense;

  @override
  Widget build(BuildContext context) {
    var _iconSize = dense ? iconSize * 0.7 : iconSize;
    var _mainButton;

    // If the audio is loading or buffering, display a circular progress indicator.
    if (playbackState?.processingState == AudioProcessingState.loading ||
        playbackState?.processingState == AudioProcessingState.buffering) {
      _mainButton = Container(
        padding: const EdgeInsets.all(SimpleConstants.md),
        width: 48,
        height: 48,
        child: const CircularProgressIndicator(),
      );
    }
    // If the audio is not playing, display the play icon.
    else if (playbackState?.playing == false) {
      _mainButton = SimpleIconButton(
        icon: Icons.play_arrow,
        iconSize: _iconSize,
        palette: Palette.secondary,
        onPressed: play,
      );
    }
    // If the audio is playing and the state is not completed, display the pause icon.
    else if (playbackState?.processingState != AudioProcessingState.completed) {
      _mainButton = SimpleIconButton(
        icon: Icons.pause,
        iconSize: _iconSize,
        palette: Palette.secondary,
        onPressed: pause,
      );
    } else {
      _mainButton = SimpleIconButton(
        icon: Icons.replay,
        iconSize: _iconSize,
        palette: Palette.secondary,
        onPressed: () {},
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TODO: Check playback state for the skip previous button
        dense
            ? const SizedBox()
            : SimpleIconButton(
                onPressed: () {},
                icon: Icons.skip_previous,
                palette: Palette.primaryContainer,
              ),
        const SizedBox(width: SimpleConstants.md),
        _mainButton,
        const SizedBox(width: SimpleConstants.md),
        // TODO: Check playback state for the skip next button
        dense
            ? const SizedBox()
            : SimpleIconButton(
                onPressed: () {},
                icon: Icons.skip_next,
                palette: Palette.primaryContainer,
              ),
      ],
    );
  }
}
