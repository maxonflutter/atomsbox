import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

class AppTextBlock extends StatelessWidget {
  const AppTextBlock({
    super.key,
    this.title,
    this.subtitle,
    this.supportingText,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? supportingText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final subtitleStyle = textTheme.bodyMedium;
    final supportingTextStyle = textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          DefaultTextStyle(
            style: titleStyle!,
            child: title!,
          ),
        if (subtitle != null)
          DefaultTextStyle(
            style: subtitleStyle!,
            maxLines: 3,
            child: subtitle!,
          ),
        if (supportingText != null)
          Container(
            margin: EdgeInsets.only(
              top: (title != null || subtitle != null) ? AppConstants.sm : 0,
            ),
            child: DefaultTextStyle(
              style: supportingTextStyle!,
              maxLines: 3,
              child: supportingText!,
            ),
          ),
        if (title != null || subtitle != null || supportingText != null)
          const SizedBox(height: AppConstants.sm),
      ],
    );
  }
}
