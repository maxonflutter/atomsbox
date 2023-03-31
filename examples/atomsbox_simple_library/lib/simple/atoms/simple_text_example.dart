import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleTextExample extends StatelessWidget {
  const SimpleTextExample({
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

    final textColor =
        ThemeData.estimateBrightnessForColor(color) == Brightness.light
            ? Colors.black87
            : Colors.white;

    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(
                'SimpleText',
                textStyle: TextStyleEnum.headlineLarge,
                color: textColor,
              ),
              SimpleText(
                'SimpleText',
                textStyle: TextStyleEnum.headlineMedium,
                color: textColor,
              ),
              SimpleText(
                'SimpleText',
                textStyle: TextStyleEnum.headlineSmall,
                color: textColor,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(
                'This is a SimpleText',
                textStyle: TextStyleEnum.bodyLarge,
                color: textColor,
              ),
              SimpleText(
                'This is a SimpleText',
                textStyle: TextStyleEnum.bodyMedium,
                color: textColor,
              ),
              SimpleText(
                'This is a SimpleText',
                textStyle: TextStyleEnum.bodySmall,
                color: textColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
