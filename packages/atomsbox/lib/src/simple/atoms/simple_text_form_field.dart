import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

typedef InputDecorationBuilder = InputDecoration Function(BuildContext context);

class SimpleTextFormField extends StatelessWidget {
  SimpleTextFormField({
    super.key,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.primary = true,
    this.brightness = Brightness.light,
  }) {
    _builder = (context) {
      final colorScheme = Theme.of(context).colorScheme;
      Color backgroundColor, fontColor;

      switch (brightness) {
        case Brightness.dark:
          fontColor = Colors.white;
          if (primary) {
            backgroundColor = colorScheme.onPrimary;
          } else {
            backgroundColor = colorScheme.onSecondary;
          }
          break;
        case Brightness.light:
          fontColor = Colors.black87;
          if (primary) {
            backgroundColor = colorScheme.primary;
          } else {
            backgroundColor = colorScheme.secondary;
          }
          break;
      }

      return InputDecoration(
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: fontColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: backgroundColor),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(color: backgroundColor),
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
    this.primary = true,
    this.brightness = Brightness.light,
  }) {
    _builder = (context) {
      final colorScheme = Theme.of(context).colorScheme;
      Color backgroundColor, fontColor;

      switch (brightness) {
        case Brightness.dark:
          fontColor = Colors.white;
          if (primary) {
            backgroundColor = colorScheme.onPrimary;
          } else {
            backgroundColor = colorScheme.onSecondary;
          }
          break;
        case Brightness.light:
          fontColor = Colors.black87;
          if (primary) {
            backgroundColor = colorScheme.primary;
          } else {
            backgroundColor = colorScheme.secondary;
          }
          break;
      }

      return InputDecoration(
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: fontColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(color: backgroundColor),
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
    this.primary = true,
    this.brightness = Brightness.light,
  }) {
    _builder = (context) {
      final colorScheme = Theme.of(context).colorScheme;
      Color backgroundColor, fontColor;

      switch (brightness) {
        case Brightness.dark:
          fontColor = Colors.white;
          if (primary) {
            backgroundColor = colorScheme.onPrimary;
          } else {
            backgroundColor = colorScheme.onSecondary;
          }
          break;
        case Brightness.light:
          fontColor = Colors.black87;
          if (primary) {
            backgroundColor = colorScheme.primary;
          } else {
            backgroundColor = colorScheme.secondary;
          }
          break;
      }
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

  late final InputDecorationBuilder _builder;
  final String? initialValue;
  final String? labelText;
  final bool obscureText;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final bool primary;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = _builder.call(context);

    return TextFormField(
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: (brightness == Brightness.light)
                ? Colors.black87
                : Colors.white,
          ),
      obscureText: obscureText,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: inputDecoration,
    );
  }
}
