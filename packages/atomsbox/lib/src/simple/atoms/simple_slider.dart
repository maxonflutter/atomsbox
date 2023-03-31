import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_palettes.dart';

class SimpleSlider extends StatelessWidget {
  const SimpleSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeEnd,
    this.minValue,
    this.maxValue,
    this.thumbShape,
    this.palette = Palette.primaryContainer,
  });

  final SliderComponentShape? thumbShape;

  final double? value;

  final double? minValue;

  final double? maxValue;

  final void Function(double) onChanged;

  final void Function(double)? onChangeEnd;

  final Palette palette;

  @override
  Widget build(BuildContext context) {
    final colors = getPalette(context, palette, true);

    return SizedBox(
      height: 10,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 2.0,
          trackShape: _CustomTrackShape(),
          thumbShape: thumbShape,
          thumbColor: colors['background'],
          activeTrackColor: colors['background'],
          inactiveTrackColor: colors['disabledBackground'],
        ),
        child: Slider(
          min: minValue ?? 0.0,
          max: maxValue ?? 10.0,
          value: value ?? 0.0,
          onChanged: onChanged,
          onChangeEnd: onChangeEnd,
        ),
      ),
    );
  }
}

/// A custom track shape for the [Slider] widget that has a rounded rectangle shape.
///
/// This class extends the [RoundedRectSliderTrackShape] class to create a custom
/// track shape with rounded corners. The preferred rectangle for the track is
/// calculated based on the provided [parentBox], [sliderTheme], and [offset]
/// values. The height of the track is based on the [trackHeight] value in the
/// [sliderTheme]. If this value is null, the track height is set to 0.0.
///
/// The [isEnabled] and [isDiscrete] arguments are ignored in this custom track
/// shape.
class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 0.0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    return Rect.fromLTWH(
      trackLeft,
      trackTop,
      trackWidth,
      trackHeight,
    );
  }
}
