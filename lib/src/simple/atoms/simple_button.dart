import 'package:flutter/material.dart';

import 'simple_app_theme.dart';
import 'simple_constants.dart';

/// A simple button widget with a solid background color and rounded corners.
///
/// The [SimpleButton] widget is a convenience wrapper around the [ElevatedButton]
/// widget that provides a simple button with a solid background color and
/// rounded corners. The background color of the button is determined by the
/// [colorPalette] parameter, which can be set to one of the predefined color
/// palettes or a custom [ColorPalette] object. The [minimumSize] parameter is
/// used to set the minimum size of the button, while the [child] parameter is
/// used to specify the widget to be displayed inside the button.
///
/// The button is disabled if the [onPressed] parameter is null. When the button
/// is pressed, the [onPressed] callback is called.
///
/// See also:
/// * [ElevatedButton], which provides a more customizable button widget.
///
class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    this.onPressed,
    this.minimumSize = const Size(200.0, 50.0),
    this.colorPalette = ColorPalette.primary,
    required this.child,
  });

  /// A callback that is called when the button is pressed.
  ///
  /// If this is null, the button is disabled.
  final VoidCallback? onPressed;

  /// The minimum size of the button.
  ///
  /// Defaults to a width of 200.0 and a height of 50.0.
  final Size? minimumSize;

  /// The color palette to use for the button.
  ///
  /// This is used to set the background and foreground colors of the button.
  final ColorPalette colorPalette;

  /// The widget to be displayed inside the button.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _colorPalette = getColorPalette(colorPalette);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        backgroundColor: _colorPalette['background'],
        foregroundColor: _colorPalette['foreground'],
        disabledBackgroundColor: _colorPalette['disabledBackground'],
        disabledForegroundColor: _colorPalette['disabledForeground'],
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
