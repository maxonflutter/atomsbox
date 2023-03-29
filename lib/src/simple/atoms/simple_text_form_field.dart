import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

typedef InputDecorationBuilder = InputDecoration Function(BuildContext context);

/// A simple, customizable text form field widget.
///
/// The [SimpleTextFormField] widget wraps a [TextFormField] and provides
/// pre-styled [InputDecoration] options for filled, outline, and underline styles.
/// It also includes a customizable InputDecoration builder.
///
/// The widget takes an optional [initialValue], a flag for [obscureText],
/// and optional callbacks for [onChanged], [onEditingComplete], and [onFocusChange].
///
/// ## Predefined styles
/// There are three predefined styles provided as named constructors:
/// * [SimpleTextFormField.outline]: Creates a text form field with an outline border.
/// * [SimpleTextFormField.filled]: Creates a text form field with a filled background.
/// * [SimpleTextFormField]: The default constructor, which creates a text form field
/// with a filled background and an outline border when focused.
///
/// See also:
/// * [TextFormField], which is the underlying widget wrapped by [SimpleTextFormField].
/// * [InputDecoration], which is used to style the text form field.
///
class SimpleTextFormField extends StatelessWidget {
  SimpleTextFormField({
    super.key,
    this.initialValue = '',
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
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

  /// An optional initial value for the text form field.
  ///
  /// If not specified, the default value is an empty string.
  final String? initialValue;

  /// A boolean flag indicating whether the text should be obscured
  /// in the text form field.
  ///
  /// Defaults to false.
  final bool obscureText;

  /// An optional callback that is triggered when the text in the
  /// text form field changes.
  ///
  final Function(String)? onChanged;

  /// An optional callback that is triggered when the user finishes
  /// editing the text.
  ///
  final VoidCallback? onEditingComplete;

  /// A private late-initialized InputDecorationBuilder function that
  /// is used to generate the InputDecoration for this text form field.
  /// The InputDecoration is created based on the specific constructor
  /// called (outline, filled, or default).
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
