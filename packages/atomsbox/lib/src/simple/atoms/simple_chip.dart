import 'package:flutter/material.dart';

import 'config/simple_app_theme.dart';
import 'config/simple_constants.dart';
import 'config/simple_palettes.dart';
import 'simple_text.dart';

class SimpleChip extends StatelessWidget {
  const SimpleChip({
    super.key,
    required this.label,
    this.onPressed,
    this.selected = false,
    this.palette = Palette.primaryContainer,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool selected;
  final Palette palette;

  @override
  Widget build(BuildContext context) {
    final colors = getPalette(context, palette, true);

    return RawChip(
      selected: selected,
      showCheckmark: false,
      onPressed: onPressed,
      backgroundColor: colors['foreground'],
      selectedColor: colors['background'],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      side: selected
          ? BorderSide(color: colors['foreground'])
          : BorderSide(color: colors['background']),
      label: SimpleText(
        label,
        color: selected ? colors['foreground'] : colors['background'],
        textStyle: TextStyleEnum.bodySmall,
      ),
    );
  }
}
