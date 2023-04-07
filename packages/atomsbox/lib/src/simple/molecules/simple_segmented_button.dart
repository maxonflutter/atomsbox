import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';
import '../atoms/app_text.dart';

class SimpleSegmentedButton extends StatefulWidget {
  const SimpleSegmentedButton({
    super.key,
    this.isSelected,
    this.multiSelect = false,
    this.vertical = false,
    this.primary = true,
    required this.children,
  });

  final List<bool>? isSelected;
  final bool multiSelect;
  final bool vertical;
  final bool primary;
  final List<Widget> children;

  @override
  State<SimpleSegmentedButton> createState() => _SimpleSegmentedButtonState();
}

class _SimpleSegmentedButtonState extends State<SimpleSegmentedButton> {
  final List<bool> _isSelected = [];

  @override
  void initState() {
    if (widget.isSelected != null) {
      for (int i = 0; i < widget.isSelected!.length; i++) {
        _isSelected.insert(i, widget.isSelected![i]);
      }
    } else {
      for (int i = 0; i < widget.children.length; i++) {
        _isSelected.add(false);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double height = 40.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = widget.vertical
            ? 100
            : (constraints.maxWidth - widget.children.length - 1) /
                widget.children.length;
        return Container(
          height: widget.vertical
              ? (height * widget.children.length + widget.children.length + 1)
              : height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          child: ToggleButtons(
            selectedBorderColor: Theme.of(context).colorScheme.outlineVariant,
            borderColor: Theme.of(context).colorScheme.outline,
            fillColor: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            direction: widget.vertical ? Axis.vertical : Axis.horizontal,
            onPressed: (int index) {
              if (widget.multiSelect) {
                setState(() {
                  _isSelected[index] = !_isSelected[index];
                });
              } else {
                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected.removeAt(i);
                    _isSelected.insert(i, i == index);
                  }
                });
              }
            },
            constraints: BoxConstraints(
              minWidth: width,
              maxWidth: width,
              minHeight: height,
              maxHeight: height,
            ),
            isSelected: _isSelected,
            children: widget.children,
          ),
        );
      },
    );
  }
}
