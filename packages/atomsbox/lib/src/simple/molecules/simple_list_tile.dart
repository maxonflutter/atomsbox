import 'package:flutter/material.dart';

import '../atoms/config/simple_color_scheme.dart';
import '../atoms/config/simple_constants.dart';
import '../atoms/simple_image.dart';
import '../atoms/simple_text.dart';

class SimpleListTile extends StatelessWidget {
  const SimpleListTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.width,
    this.isThreeLine = false,
  });

  final Function()? onTap;
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final double? width;
  final Widget? trailing;
  final bool isThreeLine;

  @override
  Widget build(BuildContext context) {
    final SimpleListTileThemeData themeData =
        Theme.of(context).extension<SimpleListTileThemeData>()!;

    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 50.0),
      child: InkWell(
        splashColor: themeData.splashColor!.withOpacity(0.12),
        overlayColor: MaterialStatePropertyAll(
          themeData.splashColor!.withOpacity(0.12),
        ),
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        onTap: onTap,
        child: Row(
          children: [
            (leading != null) ? leading! : const SizedBox(),
            const SizedBox(width: SimpleConstants.sm),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(SimpleConstants.sm),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (title != null) ? title! : const SizedBox(),
                    const SizedBox(height: 4.0),
                    (subtitle != null) ? subtitle! : const SizedBox(),
                  ],
                ),
              ),
            ),
            (trailing != null) ? trailing! : const SizedBox(),
            const SizedBox(width: SimpleConstants.sm),
          ],
        ),
      ),
    );
  }
}

final simpleListTileLight = SimpleListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: SimpleColors.simpleColorSchemeLight.onInverseSurface,
  splashColor: SimpleColors.simpleColorSchemeLight.primary.withOpacity(0.3),
);

final simpleListTileDark = SimpleListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: SimpleColors.simpleColorSchemeDark.primary,
  splashColor: SimpleColors.simpleColorSchemeDark.primary.withOpacity(0.3),
);

class SimpleListTileThemeData extends ThemeExtension<SimpleListTileThemeData> {
  const SimpleListTileThemeData({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.splashColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? splashColor;

  @override
  SimpleListTileThemeData copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? splashColor,
  }) {
    return SimpleListTileThemeData(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  SimpleListTileThemeData lerp(SimpleListTileThemeData? other, double t) {
    if (other is! SimpleListTileThemeData) {
      return this;
    }
    return SimpleListTileThemeData(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      splashColor: Color.lerp(splashColor, other.splashColor, t),
    );
  }

  // Optional
  @override
  String toString() =>
      'SimpleListTileThemeData(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
}

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.byLine,
    this.paragraph,
    this.imageUrl,
    this.dense = true,
  });

  final Function()? onTap;
  final Widget title;
  final String? subtitle;
  final String? byLine;
  final String? paragraph;
  final String? imageUrl;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Theme.of(context).textTheme.bodyLarge!;
    final TextStyle subtitleStyle = Theme.of(context).textTheme.bodySmall!;

    return SimpleListTile(
      title: DefaultTextStyle(style: titleStyle, child: title),
      leading: SimpleImage(height: 100, width: 100, imageUrl!),
      subtitle: DefaultTextStyle(
        style: subtitleStyle,
        child: SimpleText(subtitle!, maxLines: 2),
      ),
    );
  }
}
