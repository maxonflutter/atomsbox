import 'package:flutter/material.dart';

import '../atoms/config/simple_app_theme.dart';
import '../atoms/config/simple_constants.dart';
import '../atoms/simple_button.dart';
import '../atoms/simple_label.dart';
import '../atoms/simple_text_form_field.dart';

/// A simple form widget that displays a list of form fields with labels
/// and a button.
///
/// The [SimpleForm] widget is a stateful widget that takes a list of [SimpleTextFormField]
/// widgets, a list of form item names, and a [SimpleButton]. It displays the form items
/// with their corresponding labels and a button at the bottom.
///
/// When a form item gains focus, its label is highlighted with the app's primary color.
///
/// See also:
/// * [SimpleTextFormField], which is used as a form field in this widget.
/// * [SimpleButton], which is used as the submit button for the form.
class SimpleForm extends StatefulWidget {
  const SimpleForm({
    super.key,
    required this.formItems,
    required this.formItemNames,
    required this.formButton,
  });

  /// A list of [SimpleTextFormField] widgets to be displayed in the form.
  final List<SimpleTextFormField> formItems;

  /// A list of strings representing the names of the form items.
  ///
  /// These strings are used as labels for the corresponding form fields.
  final List<String> formItemNames;

  /// A [SimpleButton] widget to be displayed at the bottom of the form.
  final SimpleButton formButton;

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.formItems.map(
          (item) {
            var listIndex = widget.formItems.indexOf(item);
            return _buildSimpleTextFormField(context, listIndex);
          },
        ),
        widget.formButton,
      ],
    );
  }

  Container _buildSimpleTextFormField(
    BuildContext context,
    int listIndex,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: SimpleConstants.sm),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: SimpleLabel(
              text: widget.formItemNames[listIndex],
              colorPalette: index == listIndex
                  ? ColorPalette.primary
                  : ColorPalette.primaryContainer,
            ),
          ),
          const SizedBox(width: SimpleConstants.sm),
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

// Container(
//             width: 75,
//             height: 30,
//             decoration: BoxDecoration(
//               color: index == listIndex
//                   ? Theme.of(context).colorScheme.primary
//                   : Theme.of(context).colorScheme.primaryContainer,
//               borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
//             ),
//             child: Center(
//               child: SimpleText(
//                 widget.formItemNames[listIndex],
//                 maxLines: 1,
//                 color: index == listIndex
//                     ? Theme.of(context).colorScheme.onPrimary
//                     : Theme.of(context).colorScheme.onPrimaryContainer,
//                 textAlign: TextAlign.center,
//                 textStyle: TextStyleEnum.bodySmall,
//               ),
//             ),
//           ),
