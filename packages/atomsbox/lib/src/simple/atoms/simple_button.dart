import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';
import 'config/simple_palettes.dart';
import 'simple_text.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.minimumSize = const Size(200.0, 50.0),
    this.isDark = true,
    this.palette = Palette.primary,
  }) {
    _builder = (context) {
      final colors = getPalette(context, palette, isDark);

      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          minimumSize: minimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          ),
          backgroundColor: colors['background'],
          foregroundColor: colors['foreground'],
          disabledBackgroundColor: colors['disabledBackground'],
          disabledForegroundColor: colors['disabledForeground'],
        ),
        onPressed: onPressed,
        child: SimpleText(
          text,
          color: ThemeData.estimateBrightnessForColor(colors['background']) ==
                  Brightness.light
              ? Colors.black87
              : Colors.white,
        ),
      );
    };
  }

  SimpleButton.outline({
    super.key,
    required this.text,
    required this.onPressed,
    this.minimumSize = const Size(200.0, 50.0),
    this.isDark = true,
    this.palette = Palette.primary,
  }) {
    _builder = (context) {
      final colors = getPalette(context, palette, isDark);

      return OutlinedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return colors['background']!.withOpacity(0.3);
            }
            return Colors.transparent;
          }),
          minimumSize: MaterialStateProperty.all(minimumSize),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: colors['background']!,
            ),
          ),
        ),
        onPressed: onPressed,
        child: SimpleText(
          text,
          color: ThemeData.estimateBrightnessForColor(colors['foreground']) ==
                  Brightness.light
              ? Colors.black87
              : Colors.white,
        ),
      );
    };
  }

  SimpleButton.text({
    super.key,
    required this.text,
    required this.onPressed,
    this.minimumSize = const Size(200.0, 50.0),
    this.isDark = true,
    this.palette = Palette.primary,
  }) {
    _builder = (context) {
      final colors = getPalette(context, palette, isDark);

      return TextButton(
        style: TextButton.styleFrom(
          elevation: 0.0,
          minimumSize: minimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          ),
          foregroundColor: colors['background'],
          disabledForegroundColor: colors['disabledForeground'],
        ),
        onPressed: onPressed,
        child: SimpleText(
          text,
          color: ThemeData.estimateBrightnessForColor(colors['foreground']) ==
                  Brightness.light
              ? Colors.black87
              : Colors.white,
        ),
      );
    };
  }

  final String text;

  final VoidCallback? onPressed;

  final Size? minimumSize;

  final Palette palette;

  late final WidgetBuilder _builder;

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    Widget button = _builder.call(context);
    return button;
  }
}
