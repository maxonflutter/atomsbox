import 'package:flutter/material.dart';

import 'config/simple_constants.dart';
import 'simple_text.dart';

class SimpleLabel extends StatelessWidget {
  const SimpleLabel({
    super.key,
    required this.text,
    this.icon,
    this.brightness = Brightness.light,
    this.primary = true,
  });

  final String text;
  final IconData? icon;
  final Brightness brightness;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color backgroundColor, foregroundColor;

    switch (brightness) {
      case Brightness.dark:
        if (primary) {
          backgroundColor = colorScheme.onPrimaryContainer;
          foregroundColor = colorScheme.primaryContainer;
        } else {
          backgroundColor = colorScheme.onSecondaryContainer;
          foregroundColor = colorScheme.secondaryContainer;
        }
        break;
      case Brightness.light:
        if (primary) {
          backgroundColor = colorScheme.primaryContainer;
          foregroundColor = colorScheme.onPrimaryContainer;
        } else {
          backgroundColor = colorScheme.secondaryContainer;
          foregroundColor = colorScheme.onSecondaryContainer;
        }
        break;
    }

    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...(icon == null)
              ? [const SizedBox()]
              : [
                  Icon(icon, color: foregroundColor),
                  const SizedBox(width: SimpleConstants.sm),
                ],
          SimpleText(
            text,
            color: ThemeData.estimateBrightnessForColor(backgroundColor) ==
                    Brightness.light
                ? Colors.black87
                : Colors.white,
            textStyle: SimpleTextStyle.bodyMedium,
          ),
        ],
      ),
    );
  }
}
