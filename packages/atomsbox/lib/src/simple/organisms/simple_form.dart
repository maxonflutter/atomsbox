import 'package:flutter/material.dart';

import '../atoms/app_label.dart';
import '../atoms/config/app_constants.dart';

class AppForm extends StatefulWidget {
  const AppForm({
    super.key,
    this.title,
    this.description,
    required this.formItems,
    required this.formItemNames,
    required this.formButton,
  });

  final Widget? title;
  final Widget? description;
  final List<Widget> formItems;
  final List<String> formItemNames;
  final Widget formButton;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final descriptionStyle = textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          DefaultTextStyle(
            style: titleStyle!,
            child: widget.title!,
          ),
        if (widget.description != null)
          DefaultTextStyle(
            style: descriptionStyle!,
            child: widget.description!,
          ),
        if (widget.title != null || widget.description != null)
          const SizedBox(height: AppConstants.sm),
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
