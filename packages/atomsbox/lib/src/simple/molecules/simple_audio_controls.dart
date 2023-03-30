import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

import '../atoms/config/simple_app_theme.dart';
import '../atoms/config/simple_constants.dart';
import '../atoms/simple_icon_button.dart';

/// A widget for displaying simple audio playback controls.
///
/// The [SimpleAudioControls] widget provides a simple set of audio playback
/// controls to use in a Flutter app. It displays a single button that toggles
/// between the play and pause icons, depending on the current state of the audio
/// playback. Additionally, when the audio is loading or buffering, it displays
/// a circular progress indicator.
///
/// The [play] and [pause] arguments are required and specify the callbacks to
/// be invoked when the user taps the play and pause buttons, respectively. The
/// [playbackState] argument is optional and represents the current state of the
/// audio playback. If it is not provided, the widget will default to the play
/// icon. The [dense] argument is also optional and specifies whether the widget
/// should be displayed in a denser layout than usual.
///
/// If the audio is loading or buffering, the widget will display a circular
/// progress indicator. If the audio is not playing, the widget will display the
/// play icon. If the audio is playing but not yet completed, the widget will
/// display the pause icon. If the audio has completed playing, the widget will
/// display the replay icon.
class SimpleAudioControls extends StatelessWidget {
  const SimpleAudioControls({
    Key? key,
    this.iconSize = 50,
    required this.play,
    required this.pause,
    this.playbackState,
    this.dense = false,
  }) : super(key: key);

  /// The size of the icons to be displayed in the widget.
  final double iconSize;

  /// The callback to be invoked when the user taps the play button.
  final VoidCallback play;

  /// The callback to be invoked when the user taps the pause button.
  final VoidCallback pause;

  /// The current state of the audio playback.
  final PlaybackState? playbackState;

  /// Whether the widget should be displayed in a denser layout than usual.
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
        colorPalette: ColorPalette.secondary,
        onPressed: play,
      );
    }
    // If the audio is playing and the state is not completed, display the pause icon.
    else if (playbackState?.processingState != AudioProcessingState.completed) {
      _mainButton = SimpleIconButton(
        icon: Icons.pause,
        iconSize: _iconSize,
        colorPalette: ColorPalette.secondary,
        onPressed: pause,
      );
    } else {
      _mainButton = SimpleIconButton(
        icon: Icons.replay,
        iconSize: _iconSize,
        colorPalette: ColorPalette.secondary,
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
                colorPalette: ColorPalette.surface,
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
                colorPalette: ColorPalette.surface,
              ),
      ],
    );
  }
}
