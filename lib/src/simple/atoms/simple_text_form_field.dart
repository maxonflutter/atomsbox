import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

typedef InputDecorationBuilder = InputDecoration Function(BuildContext context);

class SimpleTextFormField extends StatelessWidget {
  SimpleTextFormField({
    super.key,
    this.initialValue = '',
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFocusChange,
  }) {
    _builder = (context) {
      return InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    };
  }

  SimpleTextFormField.outline({
    super.key,
    this.initialValue = '',
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFocusChange,
  }) {
    _builder = (context) {
      return InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      );
    };
  }

  SimpleTextFormField.filled({
    super.key,
    this.initialValue = '',
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFocusChange,
  }) {
    _builder = (context) {
      return InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      );
    };
  }

  final String? initialValue;
  final bool obscureText;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onFocusChange;
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
