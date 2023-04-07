import 'package:flutter/material.dart';

import '../atoms/app_label.dart';
import '../atoms/app_text_form_field.dart';
import '../atoms/config/app_constants.dart';

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
  final List<AppTextFormField> formItems;
  final List<String> formItemNames;
  final Widget formButton;

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
                const SizedBox(height: AppConstants.sm),
              ]
            : [const SizedBox()],
        ...(widget.description != null)
            ? [
                DefaultTextStyle(
                  style: descriptionStyle!,
                  child: widget.description!,
                ),
                const SizedBox(height: AppConstants.sm),
              ]
            : [const SizedBox()],
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
