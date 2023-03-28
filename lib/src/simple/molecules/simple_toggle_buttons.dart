import 'package:flutter/material.dart';

import '../atoms/simple_constants.dart';
import '../atoms/simple_text.dart';

/// A simple toggle button set with customizable options.
///
/// The [SimpleToggleButtons] widget displays a set of toggle buttons which can
/// be used for single or multi-select behavior. The toggle buttons are
/// displayed either horizontally or vertically based on the provided flag.
///
/// An optional [title] can be provided, which will be displayed above the set
/// of toggle buttons.
///
/// The [isSelected] argument is a list of boolean values that corresponds to
/// the initial selection state of each toggle button. If it is not provided,
/// all the buttons will be initialized as unselected.
///
/// The [multiSelect] argument is a boolean flag that determines whether
/// multiple buttons can be selected at the same time. By default, it is set to
/// false, which means only one button can be selected at a time.
///
/// The [vertical] argument is a boolean flag that determines whether the
/// buttons should be displayed vertically. By default, it is set to false,
/// which means the buttons will be displayed horizontally.
///
/// The [children] argument is a list of widgets that will be used as the
/// contents of the toggle buttons. The length of the [isSelected] list should
/// match the length of the [children] list.
///
/// See also:
/// * [ToggleButtons], which is the underlying implementation of the button set.
///
class SimpleToggleButtons extends StatefulWidget {
  const SimpleToggleButtons({
    super.key,
    this.title,
    this.isSelected,
    this.multiSelect = false,
    this.vertical = false,
    required this.children,
  });

  /// An optional title to display above the set of toggle buttons.
  final String? title;

  /// A list of boolean values representing the initial selection state of
  /// each toggle button.
  final List<bool>? isSelected;

  /// A flag that determines whether multiple buttons can be selected at the
  /// same time. Defaults to false, which means only one button can be selected
  /// at a time.
  final bool multiSelect;

  /// A flag that determines whether the buttons should be displayed
  /// vertically. Defaults to false, which means the buttons will be displayed
  /// horizontally.
  final bool vertical;

  /// A list of widgets that will be used as the contents of the toggle buttons.
  final List<Widget> children;

  @override
  State<SimpleToggleButtons> createState() => _SimpleToggleButtonsState();
}

class _SimpleToggleButtonsState extends State<SimpleToggleButtons> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(widget.title != null)
            ? [
                SimpleText(widget.title!),
                const SizedBox(height: SimpleConstants.sm),
              ]
            : [const SizedBox()],
        LayoutBuilder(
          builder: (context, constraints) {
            double width = (constraints.maxWidth - widget.children.length - 1) /
                widget.children.length;
            return ToggleButtons(
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
              borderRadius: BorderRadius.circular(SimpleConstants.md),
              selectedBorderColor: Theme.of(context).colorScheme.primary,
              fillColor: Theme.of(context).colorScheme.primaryContainer,
              constraints: BoxConstraints(
                minWidth: width,
                maxWidth: width,
                minHeight: 40.0,
                maxHeight: 40.0,
              ),
              isSelected: _isSelected,
              children: widget.children,
            );
          },
        ),
      ],
    );
  }
}
