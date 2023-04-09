import 'package:atomsbox/src/atomsbox/atoms/config/app_constants.dart';
import 'package:flutter/material.dart';

import 'config/app_color_scheme.dart';
import 'app_text.dart';

class AppSlider extends StatelessWidget {
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

  final SliderComponentShape? thumbShape;
  final double? height;
  final double? value;
  final double? minValue;
  final double? maxValue;
  final int? divisions;
  final Function(double)? onChanged;
  final Function(double)? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: thumbShape,
        ),
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
