import 'package:flutter/material.dart';

import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';

/// A customizable slider widget.
///
/// The [AppSlider] widget displays a slider with a customizable thumb shape,
/// height, and range. It allows users to select a value within the specified
/// range by moving the slider thumb.
///
/// The [value] argument is required and represents the current value of the slider.
///
/// The [onChanged] callback is called when the user starts dragging the slider
/// thumb, and it is required. It provides the new value as the user drags the thumb.
///
/// The [onChangeEnd] callback is optional and called when the user stops dragging
/// the slider thumb. It provides the final value after the user finishes dragging.
///
/// The [height] argument is optional and allows you to set the height of the slider.
///
/// The [minValue] and [maxValue] arguments are optional and represent the minimum
/// and maximum values of the slider, respectively. If not provided, the default
/// values are 0.0 for [minValue] and 10.0 for [maxValue].
///
/// The [divisions] argument is optional and represents the number of discrete
/// divisions. If not provided, the slider will have continuous values.
///
/// The [thumbShape] argument is optional and allows you to customize the slider
/// thumb shape.
///
/// See also:
///
/// * [Slider], which is the base widget for creating sliders.
/// * [SliderTheme], which allows you to customize the appearance of the slider.
class AppSlider extends StatelessWidget {
  /// Creates a customizable slider widget.
  ///
  /// The [value] and [onChanged] parameters must not be null.
  const AppSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.height,
    this.onChangeEnd,
    this.minValue = 0.0,
    this.maxValue = 10.0,
    this.divisions,
    this.thumbShape,
  });

  /// The custom shape of the slider thumb.
  ///
  /// If null, the default thumb shape will be used.
  final SliderComponentShape? thumbShape;

  /// The height of the slider.
  ///
  /// If null, the slider will have a default height.
  final double? height;

  /// The current value of the slider.
  final double? value;

  /// The minimum value of the slider.
  final double? minValue;

  /// The maximum value of the slider.
  final double? maxValue;

  /// The number of discrete divisions.
  ///
  /// If null, the slider will have continuous values.
  final int? divisions;

  /// The callback function called when the user starts dragging the slider thumb.
  ///
  /// Provides the new value as the user drags the thumb.
  final Function(double)? onChanged;

  /// The callback function called when the user stops dragging the slider thumb.
  ///
  /// Provides the final value after the user finishes dragging.
  final Function(double)? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(thumbShape: thumbShape),
        child: Slider(
          min: minValue ?? 0.0,
          max: maxValue ?? 10.0,
          value: value ?? 0.0,
          divisions: divisions,
          label: value.toString(),
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
    final double trackLeft = offset.dx + AppConstants.sm;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - AppConstants.lg;

    return Rect.fromLTWH(
      trackLeft,
      trackTop,
      trackWidth,
      trackHeight,
    );
  }
}

final appSliderThemeLight = SliderThemeData(
  trackHeight: 2.0,
  showValueIndicator: ShowValueIndicator.onlyForDiscrete,
  valueIndicatorShape: ThemeData.light().sliderTheme.valueIndicatorShape,
  trackShape: _CustomTrackShape(),
  thumbColor: AppColors.appColorSchemeLight.primary,
  activeTrackColor: AppColors.appColorSchemeLight.primary,
  inactiveTrackColor: AppColors.appColorSchemeLight.surface.withOpacity(0.38),
);

final appSliderThemeDark = SliderThemeData(
  trackHeight: 2.0,
  showValueIndicator: ShowValueIndicator.onlyForDiscrete,
  valueIndicatorShape: ThemeData.dark().sliderTheme.valueIndicatorShape,
  trackShape: _CustomTrackShape(),
  thumbColor: AppColors.appColorSchemeDark.primary,
  activeTrackColor: AppColors.appColorSchemeDark.primary,
  inactiveTrackColor: AppColors.appColorSchemeDark.surface.withOpacity(0.38),
);
