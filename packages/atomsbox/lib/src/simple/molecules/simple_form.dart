import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_button.dart';
import '../atoms/simple_label.dart';
import '../atoms/simple_text_form_field.dart';

class SimpleForm extends StatefulWidget {
  const SimpleForm({
    super.key,
    this.title,
    this.description,
    required this.formItems,
    required this.formItemNames,
    required this.formButton,
  });

  final Widget? title;
  final Widget? description;
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
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final descriptionStyle = textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(widget.title != null)
            ? [
                DefaultTextStyle(
                  style: titleStyle!,
                  child: widget.title!,
                ),
                const SizedBox(height: SimpleConstants.sm),
              ]
            : [const SizedBox()],
        ...(widget.description != null)
            ? [
                DefaultTextStyle(
                  style: descriptionStyle!,
                  child: widget.description!,
                ),
                const SizedBox(height: SimpleConstants.sm),
              ]
            : [const SizedBox()],
        ...widget.formItems.map(
          (item) {
            var listIndex = widget.formItems.indexOf(item);
            return _buildSimpleTextFormField(context, listIndex);
          },
        ),
        const SizedBox(height: SimpleConstants.sm),
        Center(child: widget.formButton),
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
              primary: listIndex == index ? false : true,
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
