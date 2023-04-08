import 'package:flutter/material.dart';

import '../atoms/app_slider.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import '../atoms/extensions/duration_extensions.dart';

class AppAudioSeekbar extends StatelessWidget {
  const AppAudioSeekbar({
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
