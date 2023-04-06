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
  }) {
    _builder = (context) {
      return InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      );
    };
  }

  SimpleTextFormField.outlined({
    super.key,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
  }) {
    _builder = (context) {
      return InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
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
  }) {
    _builder = (context) {
      return InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
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
