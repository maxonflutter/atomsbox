import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

/// A block of text with optional title, subtitle, and supporting text.
///
/// The [AppTextBlock] widget displays a block of text with an optional title,
/// subtitle, and supporting text. Each piece of text can have its own style
/// applied.
///
/// The [title], [subtitle], and [supportingText] arguments are optional. If
/// provided, they will be displayed in a vertical column, with the title at the
/// top, followed by the subtitle, and then the supporting text. If any of these
/// arguments is omitted, the corresponding text will not be displayed.
///
/// The text styles are determined by the current [Theme] and applied
/// automatically. If you want to customize the text styles, use the [titleStyle],
/// [subtitleStyle] and/or the [supportingTextStyle] optional arguments. Alternatively,
/// wrap the widgets in a [DefaultTextStyle] widget or apply styles directly to the text
/// widgets before passing them to the [AppTextBlock].
///
/// See also:
///
/// * [Text], which is used to display a single run of text with a single style.
/// * [Column], which is used to arrange the text widgets vertically.
class AppTextBlock extends StatelessWidget {
  /// Creates a text block widget.
  ///
  /// The [title], [subtitle], and [supportingText] arguments are optional.
  const AppTextBlock({
    super.key,
    this.title,
    this.subtitle,
    this.supportingText,
    this.titleStyle,
    this.subtitleStyle,
    this.supportingTextStyle,
  });

  /// The title to display.
  ///
  /// If null, no title will be displayed.
  final Widget? title;

  /// The subtitle to display.
  ///
  /// If null, no subtitle will be displayed.
  final Widget? subtitle;

  /// The supporting text to display.
  ///
  /// If null, no supporting text will be displayed.
  final Widget? supportingText;

  /// The style to apply to the title.
  ///
  /// If null, the style will be [textTheme.headlineSmall]
  final TextStyle? titleStyle;

  /// The style to apply to the title.
  ///
  /// If null, the style will be [textTheme.bodyMedium]
  final TextStyle? subtitleStyle;

  /// The style to apply to the title.
  ///
  /// If null, the style will be [textTheme.bodyMedium]
  final TextStyle? supportingTextStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          DefaultTextStyle(
            style: titleStyle ?? textTheme.headlineSmall!,
            child: title!,
          ),
        if (subtitle != null)
          DefaultTextStyle(
            style: subtitleStyle ?? textTheme.bodyMedium!,
            maxLines: 3,
            child: subtitle!,
          ),
        if (supportingText != null)
          Container(
            margin: EdgeInsets.only(
              top: (title != null || subtitle != null) ? AppConstants.sm : 0,
            ),
            child: DefaultTextStyle(
              style: supportingTextStyle ?? textTheme.bodyMedium!,
              maxLines: 3,
              child: supportingText!,
            ),
          ),
        if (title != null || subtitle != null || supportingText != null)
          const SizedBox(height: AppConstants.sm),
      ],
    );
  }
}
