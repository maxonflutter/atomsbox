import 'package:flutter/material.dart';

import 'config/simple_app_breakpoints.dart';

enum TextStyleEnum {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
}

class SimpleText extends Text {
  const SimpleText(
    super.data, {
    this.text,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.overflow,
    this.textGradient = false,
  });

  /// The text to display.
  final String? text;

  /// The text style to use. If not specified, it uses the default text style from the nearest [Theme] ancestor.
  final TextStyleEnum? textStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The maximum number of lines to display.
  final int? maxLines;

  /// The color to use when painting the text.
  final Color? color;

  /// The line height of the text. If null, will be calculated automatically based on the font size.
  final double? height;

  /// The font size to use when painting the text.
  final double? fontSize;

  /// The weight of the font to use when painting the text.
  final FontWeight? fontWeight;

  /// The amount of space to add between each letter.
  final double? letterSpacing;

  /// How to handle text overflow.
  final TextOverflow? overflow;

  final bool textGradient;

  @override
  Widget build(BuildContext context) {
    final style = _buildStyle(context);
    final textScaleFactor = _buildTextScaleFactor(context);

    Widget widget = Text(
      data ?? '',
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: style,
      textScaleFactor: textScaleFactor,
    );

    if (textGradient) {
      widget = _SimpleTextGradient(child: widget);
    }

    return widget;
  }

  _buildTextScaleFactor(BuildContext context) {
    if (SimpleAppBreakpoints.isWideDesktop(context) ||
        SimpleAppBreakpoints.isDesktop(context)) {
      return 1.00;
    } else if (SimpleAppBreakpoints.isWideTablet(context) ||
        SimpleAppBreakpoints.isTablet(context)) {
      return 0.95;
    } else {
      return 0.9;
    }
  }

  _buildStyle(BuildContext context) {
    switch (textStyle) {
      case TextStyleEnum.displayLarge:
        return Theme.of(context).textTheme.displayLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.displayMedium:
        return Theme.of(context).textTheme.displayMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.displaySmall:
        return Theme.of(context).textTheme.displaySmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.headlineLarge:
        return Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.headlineMedium:
        return Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.headlineSmall:
        return Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.titleLarge:
        return Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.titleMedium:
        return Theme.of(context).textTheme.titleMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.titleSmall:
        return Theme.of(context).textTheme.titleSmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case TextStyleEnum.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );

      case TextStyleEnum.bodySmall:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );

      default:
        return null;
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
    }
  }
}

/// A widget that applies a gradient to the text of a child widget.
///
/// The [_SimpleTextGradient] widget takes a [child] widget and applies a
/// gradient effect to its text. The gradient effect is created using the
/// primary and secondary colors of the current [Theme].
///
/// See also:
///
///  * [Text], which displays a run of text with a single style.
///  * [ShaderMask], which applies a shader to its child.
class _SimpleTextGradient extends StatelessWidget {
  const _SimpleTextGradient({
    super.key,
    required this.child,
  });

  /// The child widget containing the text to which the gradient effect will be applied.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
      ]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
