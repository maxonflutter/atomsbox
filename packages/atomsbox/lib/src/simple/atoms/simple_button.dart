import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton({
    super.key,
    required this.onPressed,
    this.minimumSize = const Size(150.0, 45.0),
    this.primary = true,
    this.brightness = Brightness.light,
    required this.child,
  }) {
    _builder = (context) {
      final colorScheme = Theme.of(context).colorScheme;
      final textTheme = Theme.of(context).textTheme;
      Color backgroundColor, foregroundColor, textColor;

      switch (brightness) {
        case Brightness.dark:
          textColor = Colors.black87;
          if (primary) {
            backgroundColor = colorScheme.onPrimary;
            foregroundColor = colorScheme.primary;
          } else {
            backgroundColor = colorScheme.onSecondary;
            foregroundColor = colorScheme.secondary;
          }
          break;
        case Brightness.light:
          textColor = Colors.white;
          if (primary) {
            backgroundColor = colorScheme.primary;
            foregroundColor = colorScheme.onPrimary;
          } else {
            backgroundColor = colorScheme.secondary;
            foregroundColor = colorScheme.onSecondary;
          }
          break;
      }

      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          minimumSize: minimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: colorScheme.surface.withOpacity(0.12),
          disabledForegroundColor: colorScheme.surface.withOpacity(0.38),
        ),
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!.copyWith(color: textColor),
          child: child,
        ),
      );
    };
  }

  SimpleButton.outline({
    super.key,
    required this.onPressed,
    this.minimumSize = const Size(150.0, 45.0),
    this.primary = true,
    this.brightness = Brightness.light,
    required this.child,
  }) {
    _builder = (context) {
      final colorScheme = Theme.of(context).colorScheme;
      final textTheme = Theme.of(context).textTheme;
      Color foregroundColor, textColor;

      switch (brightness) {
        case Brightness.dark:
          textColor = Colors.white;
          if (primary) {
            foregroundColor = colorScheme.onPrimary;
          } else {
            foregroundColor = colorScheme.onSecondary;
          }
          break;
        case Brightness.light:
          textColor = Colors.black87;
          if (primary) {
            foregroundColor = colorScheme.primary;
          } else {
            foregroundColor = colorScheme.secondary;
          }
          break;
      }

      return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return foregroundColor.withOpacity(0.3);
            }
            return Colors.transparent;
          }),
          minimumSize: MaterialStateProperty.all(minimumSize),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(color: foregroundColor)),
        ),
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!.copyWith(color: textColor),
          child: child,
        ),
      );
    };
  }

  SimpleButton.text({
    super.key,
    required this.onPressed,
    this.minimumSize = const Size(150.0, 45.0),
    this.primary = true,
    this.brightness = Brightness.light,
    required this.child,
  }) {
    _builder = (context) {
      final colorScheme = Theme.of(context).colorScheme;
      final textTheme = Theme.of(context).textTheme;
      Color foregroundColor, textColor;

      switch (brightness) {
        case Brightness.dark:
          textColor = Colors.white;
          if (primary) {
            foregroundColor = colorScheme.onPrimary;
          } else {
            foregroundColor = colorScheme.onSecondary;
          }
          break;
        case Brightness.light:
          textColor = Colors.black87;
          if (primary) {
            foregroundColor = colorScheme.primary;
          } else {
            foregroundColor = colorScheme.secondary;
          }
          break;
      }

      return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          elevation: 0.0,
          minimumSize: minimumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          ),
          foregroundColor: foregroundColor,
          disabledBackgroundColor: colorScheme.surface.withOpacity(0.12),
          disabledForegroundColor: colorScheme.surface.withOpacity(0.38),
        ),
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!.copyWith(color: textColor),
          child: child,
        ),
      );
    };
  }

  late final WidgetBuilder _builder;
  final VoidCallback? onPressed;
  final Size? minimumSize;
  final bool primary;
  final Brightness brightness;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget button = _builder.call(context);
    return button;
  }
}
