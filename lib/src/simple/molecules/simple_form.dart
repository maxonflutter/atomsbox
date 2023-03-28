import 'package:atomsbox/src/simple/atoms/simple_label.dart';
import 'package:flutter/material.dart';

import '../atoms/config/simple_app_theme.dart';
import '../atoms/config/simple_constants.dart';
import '../atoms/simple_button.dart';
import '../atoms/simple_text.dart';
import '../atoms/simple_text_form_field.dart';

class SimpleForm extends StatefulWidget {
  const SimpleForm({
    super.key,
    required this.formItems,
    required this.formItemNames,
    required this.formButton,
  });

  final List<SimpleTextFormField> formItems;
  final List<String> formItemNames;
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
          SimpleLabel(
            text: widget.formItemNames[listIndex],
            colorPalette: index == listIndex
                ? ColorPalette.primary
                : ColorPalette.primaryContainer,
          ),
          const SizedBox(width: SimpleConstants.sm),
          Flexible(
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