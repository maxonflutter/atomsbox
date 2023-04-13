import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

class AppTitleWithSubtitle extends StatelessWidget {
  const AppTitleWithSubtitle({
    super.key,
    this.title,
    this.subtitle,
  });

  final Widget? title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final subtitleStyle = textTheme.bodyMedium;

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
        if (title != null || subtitle != null)
          const SizedBox(height: AppConstants.sm),
      ],
    );
  }
}
