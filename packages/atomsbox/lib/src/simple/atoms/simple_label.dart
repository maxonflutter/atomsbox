import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';
import 'simple_text.dart';

/// A simple label widget that displays an icon and text on a solid background
/// color.
///
/// The [SimpleLabel] widget is used to display a short string of text and an
/// associated icon. The text and icon are laid out in a row, and the text is
/// always positioned to the right of the icon. The background color of the
/// label is determined by the [colorPalette] property, and the icon and text
/// colors are determined by the same color palette.
///
/// If the [colorPalette] argument is null, the label will use the primary
/// color palette by default.
///
/// See also:
/// * [SimpleText], which is used to display text with a single color palette.
/// * [SimpleIconButton], which is used to display an icon with a background color.
///
class SimpleLabel extends StatelessWidget {
  const SimpleLabel({
    super.key,
    required this.text,
    this.icon,
    this.colorPalette = ColorPalette.primary,
  });

  /// The text string to display in the label.
  final String text;

  /// The icon to display in the label.
  final IconData? icon;

  /// The color palette to use for the label.
  ///
  /// If null, the primary color palette will be used.
  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) {
    final _colorPalette = getColorPalette(colorPalette);

    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        color: _colorPalette['background'],
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Row(
        children: [
          ...(icon == null)
              ? [const SizedBox()]
              : [
                  Icon(icon, color: _colorPalette['foreground']),
                  const SizedBox(width: SimpleConstants.sm),
                ],
          SimpleText(
            text,
            color: _colorPalette['foreground'],
            textStyle: TextStyleEnum.bodyMedium,
          ),
        ],
      ),
    );
  }
}
