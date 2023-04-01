import 'package:flutter/material.dart';

class SimpleIconButton extends StatelessWidget {
  const SimpleIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.iconSize,
    this.primary = true,
    this.brightness = Brightness.light,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final double? iconSize;
  final bool primary;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Color backgroundColor, foregroundColor, highlightColor;

    switch (brightness) {
      case Brightness.dark:
        if (primary) {
          backgroundColor = colorScheme.onPrimary;
          foregroundColor = colorScheme.primary;
          highlightColor = colorScheme.onPrimary.withOpacity(0.8);
        } else {
          backgroundColor = colorScheme.onSecondary;
          foregroundColor = colorScheme.secondary;
          highlightColor = colorScheme.onSecondary.withOpacity(0.8);
        }
        break;
      case Brightness.light:
        if (primary) {
          backgroundColor = colorScheme.primary;
          foregroundColor = colorScheme.onPrimary;
          highlightColor = colorScheme.primary.withOpacity(0.8);
        } else {
          backgroundColor = colorScheme.secondary;
          foregroundColor = colorScheme.onSecondary;
          highlightColor = colorScheme.secondary.withOpacity(0.8);
        }
        break;
    }

    return IconButton(
      iconSize: iconSize,
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        highlightColor: highlightColor,
        disabledBackgroundColor: colorScheme.surface.withOpacity(0.12),
        disabledForegroundColor: colorScheme.surface.withOpacity(0.38),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: foregroundColor),
    );
  }
}
