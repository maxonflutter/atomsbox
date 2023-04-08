import 'dart:ui';

import 'package:atomsbox/src/simple/atoms/app_gradient.dart';
import 'package:flutter/material.dart';

import 'app_glass.dart';
import 'config/app_constants.dart';
import 'config/app_typedef.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: AppConstants.sm),
    this.useGradient = false,
    this.useGlassEffect = false,
  }) {
    _builder = (context) {
      return InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: contentPadding,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      );
    };
  }

  AppTextFormField.outlined({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: AppConstants.sm),
    this.useGradient = false,
    this.useGlassEffect = false,
  }) {
    _builder = (context) {
      return InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.sm,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      );
    };
  }

  AppTextFormField.filled({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: AppConstants.sm),
    this.useGradient = false,
    this.useGlassEffect = false,
  }) {
    _builder = (context) {
      return InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
      );
    };
  }

  AppTextFormField.gradient({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: AppConstants.sm),
    this.useGradient = true,
    this.useGlassEffect = false,
  }) {
    _builder = (context) {
      return InputDecoration(
        filled: false,
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        floatingLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
      );
    };
  }

  AppTextFormField.glass({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue = '',
    this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: AppConstants.sm),
    this.useGradient = false,
    this.useGlassEffect = true,
  }) {
    _builder = (context) {
      return InputDecoration(
        filled: false,
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
      );
    };
  }

  late final InputDecorationBuilder _builder;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;
  final String? labelText;
  final bool obscureText;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final EdgeInsets? contentPadding;
  final bool useGradient;
  final bool useGlassEffect;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = _builder.call(context);

    TextFormField textFormField = TextFormField(
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: inputDecoration,
    );

    if (useGradient) {
      return AppGradient(child: textFormField);
    }

    if (useGlassEffect) {
      return AppGlass(child: textFormField);
    }

    return textFormField;
  }
}
