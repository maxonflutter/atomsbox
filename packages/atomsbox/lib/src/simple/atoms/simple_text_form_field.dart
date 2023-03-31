import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';
import 'config/simple_palettes.dart';

typedef InputDecorationBuilder = InputDecoration Function(BuildContext context);

class SimpleTextFormField extends StatelessWidget {
  SimpleTextFormField({
    super.key,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.isDark = false,
    this.palette = Palette.primaryContainer,
  }) {
    _builder = (context) {
      final colors = getPalette(context, palette, isDark);
      final fontColor =
          ThemeData.estimateBrightnessForColor(colors['foreground']) ==
                  Brightness.light
              ? Colors.black87
              : Colors.white;

      return InputDecoration(
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: fontColor),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: colors['background']),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(color: colors['background']),
        ),
      );
    };
  }

  SimpleTextFormField.outline({
    super.key,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.isDark = false,
    this.palette = Palette.primaryContainer,
  }) {
    _builder = (context) {
      final colors = getPalette(context, palette, isDark);
      final fontColor =
          ThemeData.estimateBrightnessForColor(colors['foreground']) ==
                  Brightness.light
              ? Colors.black87
              : Colors.white;

      return InputDecoration(
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: fontColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors['background']),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(color: colors['background']),
        ),
      );
    };
  }

  SimpleTextFormField.filled({
    super.key,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.isDark = false,
    this.palette = Palette.primaryContainer,
  }) {
    _builder = (context) {
      final fontColor = ThemeData.estimateBrightnessForColor(
                  Theme.of(context).colorScheme.surface) ==
              Brightness.light
          ? Colors.black87
          : Colors.white;

      return InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: fontColor),
        floatingLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: fontColor, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
      );
    };
  }

  final Palette palette;
  final bool isDark;
  final String? initialValue;
  final String? labelText;
  final bool obscureText;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  late final InputDecorationBuilder _builder;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = _builder.call(context);

    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: inputDecoration,
    );
  }
}
