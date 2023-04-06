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
    this.leadingWidth = 48,
    this.isThreeLine = false,
    this.primary = false,
  });

  final Function()? onTap;
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final double? width;
  final double? leadingWidth;
  final Widget? trailing;
  final bool isThreeLine;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final SimpleListTileThemeData themeData;

    if (!primary) {
      themeData = Theme.of(context).extension<SimpleListTileThemeData>()!;
    } else {
      themeData =
          Theme.of(context).extension<SimpleListTileThemeData>()!.copyWith(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                splashColor:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
              );
    }

    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 48.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Material(
        color: themeData.backgroundColor,
        child: InkWell(
          splashColor: themeData.splashColor!.withOpacity(0.12),
          overlayColor: MaterialStatePropertyAll(
            themeData.splashColor!.withOpacity(0.12),
          ),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (leading != null)
                  ? SizedBox(
                      width: leadingWidth,
                      child: leading!,
                    )
                  : const SizedBox(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(SimpleConstants.sm),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (title != null)
                          ? DefaultTextStyle(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: themeData.foregroundColor),
                              child: title!,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 4.0),
                      (subtitle != null)
                          ? DefaultTextStyle(
                              maxLines: isThreeLine ? 3 : 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: themeData.foregroundColor),
                              child: subtitle!,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              (trailing != null)
                  ? trailing!
                  : const SizedBox(width: SimpleConstants.sm),
            ],
          ),
        ),
      ),
    );
  }
}

final simpleListTileLight = SimpleListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: SimpleColors.simpleColorSchemeLight.onSurface,
  splashColor: SimpleColors.simpleColorSchemeLight.primary.withOpacity(0.3),
);

final simpleListTileDark = SimpleListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: SimpleColors.simpleColorSchemeDark.onSurface,
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
