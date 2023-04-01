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
  final _selected = [false, false];
  final _primary = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          'These are SimpleChip widgets',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
          color: widget.darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [0, 1].map(
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
                  label: '${_selected[chipIndex]}',
                  primary: _primary[chipIndex],
                  brightness:
                      widget.darkMode ? Brightness.dark : Brightness.light,
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
