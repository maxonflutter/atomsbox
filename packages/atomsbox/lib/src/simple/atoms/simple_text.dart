import 'package:flutter/material.dart';

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

/// A widget that displays a text with a specific style and properties.
///
/// The [SimpleText] widget displays a string of text with a specified style.
/// The text can be aligned, wrapped, and set to a maximum number of lines. It can also be customized
/// with properties such as color, font size, font weight, and letter spacing.
///
/// If a [textStyle] is provided, the text will use the style as defined by the [TextStyle] object.
/// If not, the text will use the default text style defined by the nearest [Theme] ancestor.
///
/// If you want to create a text widget that has a different font or color, you can specify it
/// by providing a [TextStyleEnum] value for the [textStyle] property.
///
/// The [textAlign] property determines how the text should be aligned horizontally within its container.
/// The [maxLines] property specifies the maximum number of lines to display, while [overflow] property
/// determines how to handle text overflow.
///
/// The [color], [fontSize], [fontWeight], and [letterSpacing] properties allow you
/// to customize the text's appearance.
///
/// See also:
///
/// * [Text], which displays a run of text with a single style.
/// * [TextStyle], which is used to define the appearance of text.
/// * [TextStyleEnum], an enum used to define preset text styles.
class SimpleText extends StatelessWidget {
  const SimpleText(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.overflow,
    this.textScale = false,
    this.textGradient = false,
  });

  /// The text to display.
  final String text;

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

  final bool textScale;
  final bool textGradient;

  @override
  Widget build(BuildContext context) {
    final style = _buildStyle(context);

    Widget widget = Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: style,
    );

    if (textScale) {
      widget = _SimpleTextScale(child: widget);
    }

    if (textGradient) {
      widget = _SimpleTextGradient(child: widget);
    }

    return widget;
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
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
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

/// A widget that scales the text of a child widget.
///
/// The [_SimpleTextScale] widget takes a [child] widget and scales its text by
/// the given [scale] factor. This can be useful for creating text that should
/// be larger or smaller than the surrounding text while still respecting the
/// text styles.
///
/// See also:
///  * [Text], which displays a run of text with a single style.
class _SimpleTextScale extends StatelessWidget {
  const _SimpleTextScale({
    super.key,
    this.scale = 1,
    required this.child,
  });

  /// The scale factor to apply to the text of the child widget.
  ///
  /// The default scale is 1, which means no scaling will be applied.
  final double scale;

  /// The child widget containing the text to scale.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
      child: child,
    );
  }
}
