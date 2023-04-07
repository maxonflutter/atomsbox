import 'package:flutter/material.dart';

import 'config/app_typedef.dart';

class AppText extends Text {
  AppText(
    super.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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
    this.textAlign,
    this.maxLines,
    this.overflow,
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

  late TextBuilder builder;
  final Color? color;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return builder.call(context);
  }
}
