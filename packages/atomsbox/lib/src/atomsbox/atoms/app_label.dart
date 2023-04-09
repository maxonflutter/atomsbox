import 'package:flutter/material.dart';

import 'config/app_color_scheme.dart';
import 'config/app_constants.dart';
import 'app_text.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({
    super.key,
    required this.text,
    this.icon,
    this.primary = true,
  });

  final String text;
  final IconData? icon;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final AppLabelThemeData themeData;

    if (primary) {
      themeData = Theme.of(context).extension<AppLabelThemeData>()!;
    } else {
      themeData = Theme.of(context).extension<AppLabelThemeData>()!.copyWith(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          );
    }

    return Container(
      padding: const EdgeInsets.all(AppConstants.sm),
      decoration: BoxDecoration(
        color: themeData.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...(icon == null)
              ? [const SizedBox()]
              : [
                  Icon(icon, color: themeData.foregroundColor),
                  const SizedBox(width: AppConstants.sm),
                ],
          AppText(text),
        ],
      ),
    );
  }
}

final appLabelLight = AppLabelThemeData(
  backgroundColor: AppColors.appColorSchemeLight.primaryContainer,
  foregroundColor: AppColors.appColorSchemeLight.onPrimaryContainer,
);

final appLabelDark = AppLabelThemeData(
  backgroundColor: AppColors.appColorSchemeDark.primaryContainer,
  foregroundColor: AppColors.appColorSchemeDark.onPrimaryContainer,
);

class AppLabelThemeData extends ThemeExtension<AppLabelThemeData> {
  const AppLabelThemeData({
    required this.foregroundColor,
    required this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  AppLabelThemeData copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? splashColor,
  }) {
    return AppLabelThemeData(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  AppLabelThemeData lerp(AppLabelThemeData? other, double t) {
    if (other is! AppLabelThemeData) {
      return this;
    }
    return AppLabelThemeData(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }

  // Optional
  @override
  String toString() =>
      'AppLabelThemeData(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
}
