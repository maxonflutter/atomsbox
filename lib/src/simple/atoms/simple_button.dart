import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';

/// A simple customizable button with three styles.
///
/// The [SimpleButton] widget provides an easy way to create customizable
/// buttons with three different styles: filled, outlined, and text.
/// Each style can be configured with a custom [minimumSize] and [colorPalette].
///
/// To create a filled button, use the default constructor:
/// SimpleButton({required VoidCallback? onPressed, required Widget child, Size?
/// minimumSize, ColorPalette colorPalette}).
///
/// To create an outlined button, use the SimpleButton.outline constructor:
/// SimpleButton.outline({required VoidCallback? onPressed, required Widget child,
/// Size? minimumSize, ColorPalette colorPalette}).
///
/// To create a text button, use the SimpleButton.text constructor:
/// SimpleButton.text({required VoidCallback? onPressed, required Widget child,
/// Size? minimumSize, ColorPalette colorPalette}).
///
/// See also:
/// * [ElevatedButton], the underlying filled button widget.
/// * [OutlinedButton], the underlying outlined button widget.
/// * [TextButton], the underlying text button widget.
class SimpleButton extends StatelessWidget {
  SimpleButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.minimumSize = const Size(200.0, 50.0),
    this.colorPalette = ColorPalette.primary,
  }) {
    _builder = (context) {
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
    };
  }

  SimpleButton.outline({
    super.key,
    required this.onPressed,
    required this.child,
    this.minimumSize = const Size(200.0, 50.0),
    this.colorPalette = ColorPalette.primary,
  }) {
    _builder = (context) {
      final _colorPalette = getColorPalette(colorPalette);

      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 0.0,
          minimumSize: minimumSize,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: _colorPalette['background'] ??
                  Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          ),
          foregroundColor: _colorPalette['background'],
          disabledForegroundColor: _colorPalette['disabledForeground'],
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  SimpleButton.text({
    super.key,
    required this.onPressed,
    required this.child,
    this.minimumSize = const Size(200.0, 50.0),
    this.colorPalette = ColorPalette.primary,
  }) {
    _builder = (context) {
      final _colorPalette = getColorPalette(colorPalette);

      return TextButton(
        style: TextButton.styleFrom(
          elevation: 0.0,
          minimumSize: minimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          ),
          foregroundColor: _colorPalette['background'],
          disabledForegroundColor: _colorPalette['disabledForeground'],
        ),
        onPressed: onPressed,
        child: child,
      );
    };
  }

  /// The callback that is called when the button is tapped or otherwise
  /// activated.
  ///
  /// If this is null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The minimum size of the button.
  ///
  /// Defaults to a size of 200.0 by 50.0 logical pixels.
  final Size? minimumSize;

  /// The color palette to use for the button.
  ///
  /// Defaults to [ColorPalette.primary].
  final ColorPalette colorPalette;

  /// The builder function to create the button based on
  /// the selected button style.
  ///
  late final WidgetBuilder _builder;

  @override
  Widget build(BuildContext context) {
    Widget button = _builder.call(context);
    return button;
  }
}
