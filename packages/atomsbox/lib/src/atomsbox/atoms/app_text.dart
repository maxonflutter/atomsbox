import 'package:flutter/material.dart';

import 'config/app_typedef.dart';

/// A customizable text widget.
///
/// The [AppText] widget provides an extended [Text] widget that allows
/// customization of text styles based on predefined typography categories
/// (e.g., display, headline, title, body, and label) and sizes (large, medium,
/// and small). This makes it easier to maintain a consistent text appearance
/// throughout the application.
///
/// Each category and size combination has a dedicated constructor, such as
/// [AppText.displayLarge], [AppText.headlineMedium], [AppText.titleSmall], and so on.
///
/// The [color], [height], [fontSize], [fontWeight], and [letterSpacing]
/// arguments are optional and can be used to further customize the text style.
///
/// The [textAlign], [maxLines], and [overflow] arguments are inherited from the
/// [Text] widget and have the same behavior.
///
/// Example usage:
///
/// dart /// AppText.headlineLarge( /// 'This is a large headline', /// color: Colors.blue, /// letterSpacing: 1.2, /// ), /// ///
/// See also:
///
/// * [Text], which is the base widget for displaying text.
/// * [TextStyle], which holds the style properties for the text.
/// * [Theme], which holds the text theme used for styling the text.

// ignore: must_be_immutable
class AppText extends Text {
  AppText(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
      );
    };
  }

  AppText.displayLarge(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.displayMedium(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.displaySmall(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.headlineLarge(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.headlineMedium(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.headlineSmall(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.titleLarge(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.titleMedium(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.titleSmall(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.bodyLarge(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.bodyMedium(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.bodySmall(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.labelLarge(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.labelMedium(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  AppText.labelSmall(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    super.textAlign,
    super.maxLines,
    super.overflow,
  }) {
    builder = (context) {
      return Text(
        data ?? '',
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ),
      );
    };
  }

  /// A TextBuilder type function that is responsible for building the actual Text
  /// widget with the desired text style based on the provided customization options.
  late TextBuilder builder;

  /// The color of the text.
  ///
  /// This is an optional Color type property.
  final Color? color;

  /// The height of the text, which affects the line height.
  ///
  /// This is an optional double type property.
  final double? height;

  /// fontSize: The size of the text font.
  ///
  /// This is an optional double type property.
  final double? fontSize;

  /// The thickness of the text font, represented by the FontWeight enumeration.
  ///
  ///  This is an optional property.
  final FontWeight? fontWeight;

  /// The amount of space between the letters of the text.
  ///
  ///  This is an optional double type property.
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return builder.call(context);
  }
}
