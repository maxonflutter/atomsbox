import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_palettes.dart';

class SimpleIconButton extends StatelessWidget {
  const SimpleIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.palette = Palette.primary,
  });

  final IconData icon;

  final double? iconSize;

  final VoidCallback? onPressed;

  final Palette palette;

  @override
  Widget build(BuildContext context) {
    final _palette = getPalette(context, palette, true);

    return IconButton(
      iconSize: iconSize,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: _palette['background'],
        foregroundColor: _palette['foreground'],
        highlightColor: _palette['highlight'],
        disabledBackgroundColor: _palette['disabledBackground'],
        disabledForegroundColor: _palette['disabledForeground'],
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: _palette['foreground']),
    );
  }
}
