import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

class SimpleTextFormField extends StatelessWidget {
  const SimpleTextFormField({
    super.key,
    this.initialValue = '',
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFocusChange,
  });

  final String? initialValue;
  final bool obscureText;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onFocusChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
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
      ),
    );
  }
}
