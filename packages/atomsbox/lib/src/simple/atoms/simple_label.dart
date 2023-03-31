import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';
import 'config/simple_palettes.dart';
import 'simple_text.dart';

class SimpleLabel extends StatelessWidget {
  const SimpleLabel({
    super.key,
    required this.text,
    this.icon,
    this.palette = Palette.primary,
  });

  final String text;
  final IconData? icon;
  final Palette palette;

  @override
  Widget build(BuildContext context) {
    final colors = getPalette(context, palette, true);

    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...(icon == null)
              ? [const SizedBox()]
              : [
                  Icon(icon, color: colors['foreground']),
                  const SizedBox(width: SimpleConstants.sm),
                ],
          SimpleText(
            text,
            color: ThemeData.estimateBrightnessForColor(colors['background']) ==
                    Brightness.light
                ? Colors.black87
                : Colors.white,
            textStyle: TextStyleEnum.bodyMedium,
          ),
        ],
      ),
    );
  }
}
