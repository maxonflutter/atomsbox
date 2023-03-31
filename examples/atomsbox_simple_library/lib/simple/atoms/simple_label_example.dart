import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleLabelExample extends StatelessWidget {
  const SimpleLabelExample({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    List<Palette> palettes;
    final color =
        darkMode ? Theme.of(context).colorScheme.primary : Colors.white;

    if (darkMode == false) {
      palettes = [
        Palette.primary,
        Palette.primaryContainer,
        Palette.secondary,
        Palette.secondaryContainer,
      ];
    } else {
      palettes = [
        Palette.primaryDark,
        Palette.primaryContainerDark,
        Palette.secondaryDark,
        Palette.secondaryContainerDark,
      ];
    }

    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleText(
            'These are SimpleLabel widgets',
            textStyle: TextStyleEnum.titleMedium,
            fontWeight: FontWeight.bold,
            color:
                ThemeData.estimateBrightnessForColor(color) == Brightness.light
                    ? Colors.black87
                    : Colors.white,
          ),
          const SizedBox(height: SimpleConstants.sm),
          Row(
            children: [
              SimpleLabel(
                icon: Icons.person,
                text: 'This is a label',
                palette: palettes[0],
              ),
              const SizedBox(width: SimpleConstants.sm),
              SimpleLabel(
                icon: Icons.person,
                text: 'This is a label',
                palette: palettes[1],
              ),
            ],
          ),
          const SizedBox(height: SimpleConstants.sm),
          Row(
            children: [
              SimpleLabel(
                icon: Icons.person,
                text: 'This is a label',
                palette: palettes[2],
              ),
              const SizedBox(width: SimpleConstants.sm),
              SimpleLabel(
                icon: Icons.person,
                text: 'This is a label',
                palette: palettes[3],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
