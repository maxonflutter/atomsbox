import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleChipExample extends StatefulWidget {
  const SimpleChipExample({
    super.key,
  });

  @override
  State<SimpleChipExample> createState() => _SimpleChipExampleState();
}

class _SimpleChipExampleState extends State<SimpleChipExample> {
  final _selected = [false, false, false, false];

  final _colorPalette = [
    ColorPalette.primary,
    ColorPalette.primaryContainer,
    ColorPalette.secondary,
    ColorPalette.secondaryContainer,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleChip widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Wrap(
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
                    colorPalette: _colorPalette[chipIndex],
                    label: '${_selected[chipIndex]}'),
              );
            },
          ).toList(),
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
