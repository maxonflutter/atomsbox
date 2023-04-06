import 'package:flutter/material.dart';

import 'config/simple_color_scheme.dart';
import 'config/simple_constants.dart';
import 'simple_text.dart';

class SimpleLabel extends StatelessWidget {
  const SimpleLabel({
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
    final SimpleLabelThemeData themeData;

    if (primary) {
      themeData = Theme.of(context).extension<SimpleLabelThemeData>()!;
    } else {
      themeData = Theme.of(context).extension<SimpleLabelThemeData>()!.copyWith(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          );
    }

    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        color: themeData.backgroundColor,
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...(icon == null)
              ? [const SizedBox()]
              : [
                  Icon(icon, color: themeData.foregroundColor),
                  const SizedBox(width: SimpleConstants.sm),
                ],
          SimpleText(text),
        ],
      ),
    );
  }
}

final simpleLabelLight = SimpleLabelThemeData(
  backgroundColor: SimpleColors.simpleColorSchemeLight.primaryContainer,
  foregroundColor: SimpleColors.simpleColorSchemeLight.onPrimaryContainer,
);

final simpleLabelDark = SimpleLabelThemeData(
  backgroundColor: SimpleColors.simpleColorSchemeDark.primaryContainer,
  foregroundColor: SimpleColors.simpleColorSchemeDark.onPrimaryContainer,
);

class SimpleLabelThemeData extends ThemeExtension<SimpleLabelThemeData> {
  const SimpleLabelThemeData({
    required this.foregroundColor,
    required this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  SimpleLabelThemeData copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? splashColor,
  }) {
    return SimpleLabelThemeData(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  SimpleLabelThemeData lerp(SimpleLabelThemeData? other, double t) {
    if (other is! SimpleLabelThemeData) {
      return this;
    }
    return SimpleLabelThemeData(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }

  // Optional
  @override
  String toString() =>
      'SimpleLabelThemeData(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
}
