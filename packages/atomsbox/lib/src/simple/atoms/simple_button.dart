import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'config/simple_color_scheme.dart';
import 'config/simple_constants.dart';
import 'config/simple_text_theme.dart';

typedef ButtonBuilder = Widget Function(BuildContext context);

class SimpleButton extends StatelessWidget {
  SimpleButton.elevated({
    super.key,
    this.themeData,
    this.primary = true,
    required this.child,
  }) {
    builder = (context) {
      if (themeData == null) {
        return ElevatedButton(
          style: primary
              ? null
              : ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                ),
          onPressed: () {},
          child: child,
        );
      } else {
        return ElevatedButtonTheme(
          data: themeData!.elevatedButtonTheme,
          child: ElevatedButton(
            onPressed: () {},
            child: child,
          ),
        );
      }
    };
  }

  SimpleButton.text({
    super.key,
    this.themeData,
    this.primary = true,
    required this.child,
  }) {
    builder = (context) {
      if (themeData == null) {
        return TextButton(
          style: primary
              ? null
              : TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                ),
          onPressed: () {},
          child: child,
        );
      } else {
        return TextButtonTheme(
          data: themeData!.textButtonTheme,
          child: TextButton(
            onPressed: () {},
            child: child,
          ),
        );
      }
    };
  }

  SimpleButton.outline({
    super.key,
    this.themeData,
    this.primary = true,
    required this.child,
  }) {
    builder = (context) {
      if (themeData == null) {
        return OutlinedButton(
          style: primary
              ? null
              : OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                ),
          onPressed: () {},
          child: child,
        );
      } else {
        return OutlinedButtonTheme(
          data: themeData!.outlinedButtonTheme,
          child: OutlinedButton(
            onPressed: () {},
            child: child,
          ),
        );
      }
    };
  }

  SimpleButton.icon({
    super.key,
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
          onPressed: () {},
          icon: child,
        );
      } else {
        return IconButtonTheme(
          data: themeData!.iconButtonTheme,
          child: IconButton(
            onPressed: () {},
            icon: child,
          ),
        );
      }
    };
  }

  late ButtonBuilder builder;
  final ThemeData? themeData;
  final bool primary;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget button = builder.call(context);
    return button;
  }
}

final simpleElevatedButtonThemeLight = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: simpleColorSchemeLight.primary,
    backgroundColor: simpleColorSchemeLight.surface,
    disabledForegroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: simpleColorSchemeLight.shadow,
    surfaceTintColor: simpleColorSchemeLight.surfaceTint,
  ),
);

final simpleElevatedButtonThemeDark = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: simpleColorSchemeDark.primary,
    backgroundColor: simpleColorSchemeDark.surface,
    disabledForegroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: simpleColorSchemeDark.shadow,
    surfaceTintColor: simpleColorSchemeDark.surfaceTint,
  ),
);

final simpleTextButtonThemeLight = TextButtonThemeData(
  style: TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: simpleColorSchemeLight.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: simpleColorSchemeLight.shadow,
    surfaceTintColor: simpleColorSchemeLight.surfaceTint,
  ),
);

final simpleOutlinedButtonThemeDark = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      side: BorderSide(color: simpleColorSchemeDark.primary),
    ),
    side: BorderSide(color: simpleColorSchemeDark.primary),
    minimumSize: const Size(100, 45),
    foregroundColor: simpleColorSchemeDark.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: null,
    surfaceTintColor: null,
  ),
);
final simpleOutlinedButtonThemeLight = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      side: BorderSide(color: simpleColorSchemeLight.primary, width: 5),
    ),
    side: BorderSide(color: simpleColorSchemeLight.primary),
    minimumSize: const Size(100, 45),
    foregroundColor: simpleColorSchemeLight.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: null,
    surfaceTintColor: null,
  ),
);

final simpleTextButtonThemeDark = TextButtonThemeData(
  style: TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
    ),
    minimumSize: const Size(100, 45),
    foregroundColor: simpleColorSchemeDark.primary,
    backgroundColor: Colors.transparent,
    disabledForegroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: simpleColorSchemeDark.shadow,
    surfaceTintColor: simpleColorSchemeDark.surfaceTint,
  ),
);

final simpleIconButtonThemeLight = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: simpleColorSchemeLight.surface,
    backgroundColor: simpleColorSchemeLight.primary,
    disabledForegroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeLight.onSurface.withOpacity(0.12),
    shadowColor: simpleColorSchemeLight.shadow,
    surfaceTintColor: simpleColorSchemeLight.surfaceTint,
  ),
);

final simpleIconButtonThemeDark = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: simpleColorSchemeDark.surface,
    backgroundColor: simpleColorSchemeDark.primary,
    disabledForegroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.38),
    disabledBackgroundColor: simpleColorSchemeDark.onSurface.withOpacity(0.12),
    shadowColor: simpleColorSchemeDark.shadow,
    surfaceTintColor: simpleColorSchemeDark.surfaceTint,
  ),
);
