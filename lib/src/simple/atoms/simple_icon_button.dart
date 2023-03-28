import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';

/// A simple icon button with a solid color background and rounded corners.
///
/// The [SimpleIconButton] displays an [icon] inside a circular-shaped button with
/// a solid color background. The button's background color is defined by the
/// [colorPalette] property, which defaults to the [ColorPalette.primary] color
/// scheme. The [iconSize] parameter controls the size of the [icon] within the button.
///
/// When the button is pressed, the [onPressed] callback is invoked.
///
/// See also:
/// * [IconButton], a Material Design icon button.
///
class SimpleIconButton extends StatelessWidget {
  const SimpleIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.colorPalette = ColorPalette.primary,
  });

  /// The icon to display inside the button.
  final IconData icon;

  /// The size of the icon within the button.
  final double? iconSize;

  /// The callback function to invoke when the button is pressed.
  final VoidCallback? onPressed;

  /// The color palette to use for the button's background.
  ///
  /// The default color palette is [ColorPalette.primary].
  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) {
    final _colorPalette = getColorPalette(colorPalette);

    return IconButton(
      iconSize: iconSize,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: _colorPalette['background'],
        foregroundColor: _colorPalette['foreground'],
        highlightColor: _colorPalette['highlight'],
        disabledBackgroundColor: _colorPalette['disabledBackground'],
        disabledForegroundColor: _colorPalette['disabledForeground'],
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: _colorPalette['foreground']),
    );
  }
}
