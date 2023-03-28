import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';

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

  final VoidCallback? onPressed;
  final Widget child;
  final Size? minimumSize;
  final ColorPalette colorPalette;
  late final WidgetBuilder _builder;

  @override
  Widget build(BuildContext context) {
    Widget button = _builder.call(context);
    return button;
  }
}
