import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';
import 'simple_text.dart';

/// A simple chip widget with a solid background color and a border.
///
/// The [SimpleChip] widget is a convenience wrapper around the [RawChip] widget
/// that provides a simple chip with a solid background color and a border. The
/// background color of the chip is determined by the [colorPalette] parameter,
/// which can be set to one of the predefined color palettes or a custom
/// [ColorPalette] object. The [label] parameter is used to set the text
/// displayed in the chip, while the [selected] parameter is used to determine
/// whether the chip is selected.
///
/// When the chip is pressed, the [onPressed] callback is called. If the
/// [selected] parameter is true, a checkmark is displayed on the right side of
/// the chip. Otherwise, a border is displayed around the chip.
///
/// See also:
/// * [RawChip], which provides a more customizable chip widget.
///
class SimpleChip extends StatelessWidget {
  const SimpleChip({
    super.key,
    required this.label,
    this.onPressed,
    this.selected = false,
    this.colorPalette = ColorPalette.primaryContainer,
  });

  /// The text displayed in the chip.
  final String label;

  /// A callback that is called when the chip
  /// is pressed.
  ///
  /// If this is null, the chip is disabled.
  final VoidCallback? onPressed;

  /// Whether the chip is selected.
  ///
  /// If this is true, a checkmark is displayed on the
  /// right side of the chip. Otherwise, a border is
  /// displayed around the chip.
  final bool selected;

  /// The color palette to use for the chip.
  ///
  /// This is used to set the background and foreground colors of the chip.
  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) {
    final _colorPalette = getColorPalette(colorPalette);

    return RawChip(
      selected: selected,
      showCheckmark: false,
      onPressed: onPressed,
      backgroundColor: _colorPalette['foreground'],
      selectedColor: _colorPalette['background'],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      side: selected
          ? BorderSide(color: _colorPalette['foreground']!)
          : BorderSide(color: _colorPalette['background']!),
      label: SimpleText(
        label,
        color: selected
            ? _colorPalette['foreground']
            : _colorPalette['background'],
        textStyle: TextStyleEnum.bodySmall,
      ),
    );
  }
}
