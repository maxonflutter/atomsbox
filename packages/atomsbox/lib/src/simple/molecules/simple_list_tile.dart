import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_text.dart';

class SimpleListTile extends StatelessWidget {
  const SimpleListTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.tagline,
    this.leading,
    this.trailing,
    this.width,
    this.primary = true,
    this.brightness = Brightness.light,
  });

  final VoidCallback? onTap;
  final String title;
  final String? subtitle;
  final String? tagline;
  final Widget? leading;
  final Widget? trailing;
  final double? width;
  final bool primary;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color backgroundColor, foregroundColor, fontColor;

    if (primary) {
      fontColor = Colors.black87;
      backgroundColor = colorScheme.primaryContainer;
      foregroundColor = colorScheme.onPrimaryContainer;
    } else {
      fontColor = Colors.white;
      backgroundColor = colorScheme.secondaryContainer;
      foregroundColor = colorScheme.onSecondaryContainer;
    }

    return Container(
      constraints: const BoxConstraints(minHeight: 50.0),
      width: width,
      child: Material(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: backgroundColor,
        child: InkWell(
          splashColor: backgroundColor.withOpacity(0.3),
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
                              color: fontColor,
                              textStyle: SimpleTextStyle.bodySmall,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 4.0),
                      SimpleText(
                        title,
                        maxLines: 2,
                        color: fontColor,
                        fontWeight: FontWeight.bold,
                        textStyle: SimpleTextStyle.bodyMedium,
                      ),
                      const SizedBox(height: 4.0),
                      (subtitle != null)
                          ? SimpleText(
                              subtitle!,
                              maxLines: 2,
                              color: fontColor,
                              textStyle: SimpleTextStyle.bodySmall,
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
