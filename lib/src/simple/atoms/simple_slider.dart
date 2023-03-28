import 'package:flutter/material.dart';

import 'simple_app_theme.dart';

/// A slider from the atomsbox's simple design system to select a value within
/// a range by dragging a thumb.
///
/// The [SimpleSlider] widget allows the user to select a value within a range
/// by dragging a thumb along a horizontal axis. The value of the slider is
/// controlled by the [value] parameter, which represents the position of the
/// thumb. The range of the slider is determined by the [minValue] and [maxValue]
/// parameters, which default to 0.0 and 10.0 respectively if not specified.
///
/// The slider can be customized by providing a [ColorPalette] object to the
/// [colorPalette] parameter, which is used to set the active and inactive track
/// colors. The [onChanged] parameter is a required callback that is called when
/// the value of the slider is changed by the user, while the [onChangeEnd]
/// parameter is an optional callback that is called when the user stops
/// dragging the thumb.
///
class SimpleSlider extends StatelessWidget {
  const SimpleSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeEnd,
    this.minValue,
    this.maxValue,
    this.thumbShape,
    this.colorPalette = ColorPalette.primaryContainer,
  });

  final SliderComponentShape? thumbShape;

  /// The current value of the slider.
  ///
  /// If this is null, the slider is disabled.
  final double? value;

  /// The minimum value of the slider.
  ///
  /// Defaults to 0.0 if not specified.
  final double? minValue;

  /// The maximum value of the slider.
  ///
  /// Defaults to 10.0 if not specified.
  final double? maxValue;

  /// An optional callback that is called when the
  /// user drags the thumb.
  ///
  final void Function(double) onChanged;

  /// An optional callback that is called when the
  /// user stops dragging the thumb.
  ///
  final void Function(double)? onChangeEnd;

  /// The color palette to use for the slider.
  ///
  /// This is used to set the active and inactive track colors.
  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) {
    final _colorPalette = getColorPalette(colorPalette);

    return SizedBox(
      height: 10,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 2.0,
          trackShape: _CustomTrackShape(),
          thumbShape: thumbShape,
          thumbColor: _colorPalette['foreground'],
          activeTrackColor: _colorPalette['highlight'],
          inactiveTrackColor: _colorPalette['disabledBackground'],
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
