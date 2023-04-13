import 'package:flutter/material.dart';

import '../atoms/app_label.dart';
import '../atoms/config/app_constants.dart';
import '../molecules/app_text_block.dart';

/// A customizable form widget.
///
/// The [AppForm] widget displays a form with an optional title and description,
/// a list of form items, and a form button. The form items are displayed with
/// associated labels.
///
/// See also:
///
/// * [AppTextBlock], which is used to display the title and description.
class AppForm extends StatefulWidget {
  /// Creates a customizable form widget.
  ///
  /// The [formItems], [formItemNames], and [formButton] parameters must not be
  /// null.
  const AppForm({
    super.key,
    this.title,
    this.description,
    required this.formItems,
    required this.formItemNames,
    required this.formButton,
  }) : assert(formItems.length == formItemNames.length);

  /// The optional title widget to display at the top of the form.
  final Widget? title;

  /// The optional description widget to display below the title.
  final Widget? description;

  /// The list of form items to display in the form.
  ///
  /// Must not be null.
  final List<Widget> formItems;

  /// The list of names associated with each form item.
  ///
  /// Must not be null and have the same length as [formItems].
  final List<String> formItemNames;

  /// The form button widget, typically used for submission or navigation.
  ///
  /// Must not be null.
  final Widget formButton;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBlock(title: widget.title, subtitle: widget.description),
        ...widget.formItems.map(
          (item) {
            var listIndex = widget.formItems.indexOf(item);
            return _buildAppTextFormField(context, listIndex);
          },
        ),
        const SizedBox(height: AppConstants.sm),
        Center(child: widget.formButton),
      ],
    );
  }

  Container _buildAppTextFormField(
    BuildContext context,
    int listIndex,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.sm),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: AppLabel(
              text: widget.formItemNames[listIndex],
              primary: listIndex == index ? false : true,
            ),
          ),
          const SizedBox(width: AppConstants.sm),
          Flexible(
            flex: 3,
            child: Focus(
              onFocusChange: (bool value) {
                if (value) setState(() => index = listIndex);
              },
              child: widget.formItems[listIndex],
            ),
          )
        ],
      ),
    );
  }
}
