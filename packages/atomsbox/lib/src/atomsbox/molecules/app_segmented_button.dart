import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

/// A segmented button widget that can be used for selecting one or multiple options.
///
/// The [AppSegmentedButton] widget is a customizable segmented button that can
/// be used to present the user with a set of mutually exclusive options or a
/// set of options that can be selected in combination. It supports both
/// horizontal and vertical layouts and can have a primary or secondary appearance.
///
/// The widget automatically manages the selection state of its children and
/// updates the UI accordingly.
///
/// See also:
/// * [ToggleButtons], which is the underlying widget used to manage the
/// selection state and appearance of the segmented options.
class AppSegmentedButton extends StatefulWidget {
  /// Creates a segmented button widget.
  ///
  /// The [children] parameter must not be null and should contain at least one
  /// widget.
  ///
  /// If [isSelected] is provided, it should have the same length as [children].
  const AppSegmentedButton({
    super.key,
    this.isSelected,
    this.multiSelect = false,
    this.vertical = false,
    this.primary = true,
    required this.children,
  });

  /// The list of initial selection states for each child in [children].
  ///
  /// If not provided, all children will be unselected by default.
  final List<bool>? isSelected;

  /// Whether multiple children can be selected at the same time.
  ///
  /// Defaults to false.
  final bool multiSelect;

  /// Whether the segmented button should be displayed vertically.
  ///
  /// Defaults to false.
  final bool vertical;

  /// Whether the segmented button should have a primary or secondary appearance.
  ///
  /// Defaults to true.
  final bool primary;

  /// The list of widgets to be displayed as segmented options.
  ///
  /// This parameter must not be null and should contain at least one widget.
  final List<Widget> children;

  @override
  State<AppSegmentedButton> createState() => _AppSegmentedButtonState();
}

class _AppSegmentedButtonState extends State<AppSegmentedButton> {
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
