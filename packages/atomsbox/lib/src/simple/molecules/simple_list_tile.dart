import 'package:flutter/material.dart';

import '../atoms/config/simple_app_theme.dart';
import '../atoms/config/simple_constants.dart';
import '../atoms/config/simple_palettes.dart';
import '../atoms/simple_text.dart';

class SimpleListTile extends StatelessWidget {
  const SimpleListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.tagline,
    this.leading,
    this.trailing,
    this.width,
    this.onTap,
    this.palette = Palette.primaryContainer,
  });

  /// The main text to display in the tile.
  final String title;

  /// An optional secondary text to display in the tile, below [title].
  final String? subtitle;

  /// An optional tagline to display at the top of the tile, above [title].
  final String? tagline;

  /// An optional widget to display to the left of the text.
  final Widget? leading;

  /// An optional widget to display to the right of the text.
  final Widget? trailing;

  /// An optional double to define the width of the list tile.
  final double? width;

  /// An optional callback that is called when the tile is tapped.
  final VoidCallback? onTap;

  /// The color palette to use for the tile.
  final Palette palette;

  @override
  Widget build(BuildContext context) {
    final _palette = getPalette(context, palette, true);

    return Container(
      constraints: const BoxConstraints(minHeight: 50.0),
      width: width,
      child: Material(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: _palette['background'],
        child: InkWell(
          splashColor: _palette['primary'],
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          onTap: onTap,
          child: Row(
            children: [
              (leading != null) ? leading! : const SizedBox(),
              const SizedBox(width: SimpleConstants.sm),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: SimpleConstants.sm,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (tagline != null)
                          ? SimpleText(
                              tagline!,
                              color: _palette['foreground'],
                              textStyle: TextStyleEnum.bodySmall,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 4.0),
                      SimpleText(
                        title,
                        maxLines: 2,
                        color: _palette['foreground'],
                        fontWeight: FontWeight.bold,
                        textStyle: TextStyleEnum.bodyMedium,
                      ),
                      const SizedBox(height: 4.0),
                      (subtitle != null)
                          ? SimpleText(
                              subtitle!,
                              maxLines: 2,
                              color: _palette['foreground'],
                              textStyle: TextStyleEnum.bodySmall,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              ...(trailing != null)
                  ? [
                      const SizedBox(width: SimpleConstants.sm),
                      trailing!,
                    ]
                  : [const SizedBox()],
              const SizedBox(width: SimpleConstants.sm),
            ],
          ),
        ),
      ),
    );
  }
}
