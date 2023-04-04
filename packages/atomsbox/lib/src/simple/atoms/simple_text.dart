import 'package:flutter/material.dart';

import 'config/simple_app_breakpoints.dart';

enum SimpleTextStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
}

class SimpleText extends Text {
  const SimpleText(
    super.data, {
    this.textStyle,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.textScale = false,
    this.textGradient = false,
  });

  final SimpleTextStyle? textStyle;
  final Color? color;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool textScale;
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
    return 1.0;
  }

  _buildStyle(BuildContext context) {
    switch (textStyle) {
      case SimpleTextStyle.displayLarge:
        return Theme.of(context).textTheme.displayLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.displayMedium:
        return Theme.of(context).textTheme.displayMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.displaySmall:
        return Theme.of(context).textTheme.displaySmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.headlineLarge:
        return Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.headlineMedium:
        return Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.headlineSmall:
        return Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.titleLarge:
        return Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.titleMedium:
        return Theme.of(context).textTheme.titleMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.titleSmall:
        return Theme.of(context).textTheme.titleSmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.labelLarge:
        return Theme.of(context).textTheme.labelLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.labelMedium:
        return Theme.of(context).textTheme.labelMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.labelSmall:
        return Theme.of(context).textTheme.labelSmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      case SimpleTextStyle.bodySmall:
        return Theme.of(context).textTheme.bodySmall!.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: height,
            );
      default:
        return null;
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
