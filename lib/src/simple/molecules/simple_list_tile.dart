import 'package:flutter/material.dart';

import '../atoms/simple_app_theme.dart';
import '../atoms/simple_constants.dart';
import '../atoms/simple_text.dart';

/// A list tile widget that displays information based on the atomsbox's
/// simple design system.
///
/// The [SimpleListTile] widget is a container with rounded borders that
/// displays information in a horizontal layout. It consists of an optional
/// [leading] widget, a [title] and an optional [subtitle], and an optional
/// [tagline] at the top of the tile. The tile can be tapped using [onTap],
/// and its color can be customized with [colorPalette].
///
/// The [title] and [subtitle] can be styled using the [SimpleText] widget.
/// The [tagline] can be used to display a short description at the top of the
/// tile, and can also be styled with [SimpleText]. If [tagline] is not set,
/// no space will be reserved for it.
///
/// The [leading] and the [trailing] widgets are optional widgets that can be
/// used to display an icon or an image to the left and the right of the [title]
/// and [subtitle]. If [leading] and [trailing] are not set, no space will be
/// reserved for them.
///
/// If the [onTap] callback is provided, the tile will display a ripple effect
/// when tapped, otherwise it will not be interactive.
///
/// The [colorPalette] can be used to customize the colors of the tile. If not
/// set, it defaults to [ColorPalette.primary].
///
/// See also:
/// * [SimpleText], which can be used to style the [title], [subtitle], and
/// [tagline] text.
///
class SimpleListTile extends StatelessWidget {
  const SimpleListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.tagline,
    this.leading,
    this.trailing,
    this.onTap,
    this.colorPalette = ColorPalette.surface,
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

  /// An optional callback that is called when the tile is tapped.
  final VoidCallback? onTap;

  /// The color palette to use for the tile.
  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) {
    final _colorPalette = getColorPalette(colorPalette);

    return Container(
      constraints: const BoxConstraints(minHeight: 50.0),
      child: Material(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: _colorPalette['background'],
        child: InkWell(
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
                              color: _colorPalette['foreground'],
                              textStyle: TextStyleEnum.bodySmall,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 4.0),
                      SimpleText(
                        title,
                        maxLines: 2,
                        color: _colorPalette['foreground'],
                        fontWeight: FontWeight.bold,
                        textStyle: TextStyleEnum.bodyMedium,
                      ),
                      const SizedBox(height: 4.0),
                      (subtitle != null)
                          ? SimpleText(
                              subtitle!,
                              maxLines: 2,
                              color: _colorPalette['foreground'],
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
