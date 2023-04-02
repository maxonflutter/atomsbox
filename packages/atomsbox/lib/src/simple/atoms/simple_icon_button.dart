import 'package:flutter/material.dart';

import 'config/simple_color_scheme.dart';

typedef IconButtonBuilder = Widget Function(BuildContext context);

class SimpleIconButton extends StatelessWidget {
  SimpleIconButton({
    super.key,
    this.onPressed,
    this.themeData,
    this.primary = true,
    required this.child,
  }) {
    builder = (context) {
      if (themeData == null) {
        return IconButton(
          style: primary
              ? null
              : IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
          onPressed: onPressed,
          icon: child,
        );
      } else {
        return IconButtonTheme(
          data: themeData!.iconButtonTheme,
          child: IconButton(
            onPressed: onPressed,
            icon: child,
          ),
        );
      }
    };
  }

  late IconButtonBuilder builder;
  final Function()? onPressed;
  final ThemeData? themeData;
  final bool primary;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget button = builder.call(context);
    return button;
  }
}

final simpleIconButtonThemeLight = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: SimpleColors.simpleColorSchemeLight.surface,
    backgroundColor: SimpleColors.simpleColorSchemeLight.primary,
    disabledForegroundColor:
        SimpleColors.simpleColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        SimpleColors.simpleColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: SimpleColors.simpleColorSchemeLight.shadow,
    surfaceTintColor: SimpleColors.simpleColorSchemeLight.surfaceTint,
  ),
);

final simpleIconButtonThemeDark = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: SimpleColors.simpleColorSchemeDark.surface,
    backgroundColor: SimpleColors.simpleColorSchemeDark.primary,
    disabledForegroundColor:
        SimpleColors.simpleColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor:
        SimpleColors.simpleColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: SimpleColors.simpleColorSchemeDark.shadow,
    surfaceTintColor: SimpleColors.simpleColorSchemeDark.surfaceTint,
  ),
);
