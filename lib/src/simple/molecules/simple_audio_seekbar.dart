import 'package:flutter/material.dart';

import '../atoms/extensions/duration_extensions.dart';
import '../atoms/simple_slider.dart';
import '../atoms/simple_text.dart';

/// A simple audio seekbar widget.
///
/// The [SimpleAudioSeekbar] widget displays a seekbar for audio playback. The widget
/// consists of a [SimpleSlider] to control the audio playback position, and two
/// [SimpleText] widgets to display the current position and remaining time.
///
/// The [position] argument is required and specifies the current playback position
/// as a [Duration]. The [duration] argument is also required and specifies the total
/// duration of the audio as a [Duration].
///
/// The [onChanged] argument is an optional callback that is called when the user
/// starts dragging the slider. The [onChangeEnd] argument is an optional callback
/// that is called when the user stops dragging the slider.
///
/// The [dense] argument is an optional boolean that specifies whether to use a dense
/// layout for the widget. When true, the widget will have a smaller height and the
/// remaining time will not be displayed.
///
/// See also:
///
/// * [SimpleSlider], which is used to control the audio playback position.
/// * [SimpleText], which is used to display the current position and remaining time.
class SimpleAudioSeekbar extends StatelessWidget {
  const SimpleAudioSeekbar({
    super.key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangeEnd,
    this.dense = false,
  });

  /// The current playback position.
  ///
  /// This argument is required and must not be null.
  final Duration position;

  /// The total duration of the audio.
  ///
  /// This argument is required and must not be null.
  final Duration duration;

  /// An optional callback that is called when the user starts dragging the slider.
  final ValueChanged<Duration>? onChanged;

  /// An optional callback that is called when the user stops dragging the slider.
  final ValueChanged<Duration>? onChangeEnd;

  /// Whether to use a dense layout for the widget.
  ///
  /// When true, the widget will have a smaller height and the remaining
  /// time will not be displayed.
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dense ? null : 30,
      child: Stack(
        children: [
          SimpleSlider(
            value: position.inMilliseconds.toDouble(),
            maxValue: duration.inMilliseconds.toDouble(),
            thumbShape: SliderComponentShape.noThumb,
            // TODO: _audioHandler.seekTo ...
            onChanged: (p0) {},
          ),
          dense
              ? const SizedBox()
              : Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: SizedBox(
                    height: 20,
                    child: SimpleText(
                        '-${(duration - position).formatDuration()}'),
                  ),
                ),
          dense
              ? const SizedBox()
              : Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: SizedBox(
                    height: 20,
                    child: SimpleText(position.formatDuration()),
                  ),
                ),
        ],
      ),
    );
  }
}
