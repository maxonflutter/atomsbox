import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleChipExample extends StatefulWidget {
  const SimpleChipExample({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  State<SimpleChipExample> createState() => _SimpleChipExampleState();
}

class _SimpleChipExampleState extends State<SimpleChipExample> {
  final _selected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    List<Palette> palettes;
    final color =
        widget.darkMode ? Theme.of(context).colorScheme.primary : Colors.white;

    if (widget.darkMode == false) {
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
            'These are SimpleChip widgets',
            textStyle: TextStyleEnum.titleMedium,
            fontWeight: FontWeight.bold,
            color:
                ThemeData.estimateBrightnessForColor(color) == Brightness.light
                    ? Colors.black87
                    : Colors.white,
          ),
          const SizedBox(height: SimpleConstants.sm),
          Row(
            children: [0, 1, 2, 3].map(
              (chipIndex) {
                return Container(
                  margin: const EdgeInsets.only(
                    right: SimpleConstants.sm,
                    bottom: SimpleConstants.sm,
                  ),
                  child: SimpleChip(
                      onPressed: () {
                        setState(() {
                          _selected[chipIndex] = !_selected[chipIndex];
                        });
                      },
                      selected: _selected[chipIndex],
                      palette: palettes[chipIndex],
                      label: '${_selected[chipIndex]}'),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
