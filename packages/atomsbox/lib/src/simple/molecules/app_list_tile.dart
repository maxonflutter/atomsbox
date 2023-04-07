import 'package:flutter/material.dart';

import '../atoms/config/app_color_scheme.dart';
import '../atoms/config/app_constants.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.width,
    this.leadingWidth = 48,
    this.isThreeLine = false,
    this.primary = false,
  });

  final Function()? onTap;
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final double? width;
  final double? leadingWidth;
  final Widget? trailing;
  final bool isThreeLine;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final AppListTileThemeData themeData =
        Theme.of(context).extension<AppListTileThemeData>()!;

    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 48.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Material(
        color: themeData.backgroundColor,
        child: InkWell(
          splashColor: themeData.splashColor!.withOpacity(0.12),
          overlayColor: MaterialStatePropertyAll(
            themeData.splashColor!.withOpacity(0.12),
          ),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              (leading != null)
                  ? ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstants.borderRadius),
                      child: SizedBox(
                        width: leadingWidth,
                        child: leading!,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: AppConstants.sm),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (title != null)
                        ? DefaultTextStyle(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: themeData.foregroundColor),
                            child: title!,
                          )
                        : const SizedBox(),
                    ...(subtitle != null)
                        ? [
                            const SizedBox(height: AppConstants.sm * 0.5),
                            DefaultTextStyle(
                              maxLines: isThreeLine ? 3 : 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: themeData.foregroundColor),
                              child: subtitle!,
                            )
                          ]
                        : [const SizedBox()],
                  ],
                ),
              ),
              (trailing != null)
                  ? trailing!
                  : const SizedBox(width: AppConstants.sm),
            ],
          ),
        ),
      ),
    );
  }
}

final appListTileLight = AppListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: AppColors.appColorSchemeLight.onSurface,
  splashColor: AppColors.appColorSchemeLight.primary.withOpacity(0.3),
);

final appListTileDark = AppListTileThemeData(
  backgroundColor: Colors.transparent,
  foregroundColor: AppColors.appColorSchemeDark.onSurface,
  splashColor: AppColors.appColorSchemeDark.primary.withOpacity(0.3),
);

class AppListTileThemeData extends ThemeExtension<AppListTileThemeData> {
  const AppListTileThemeData({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.splashColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? splashColor;

  @override
  AppListTileThemeData copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? splashColor,
  }) {
    return AppListTileThemeData(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  AppListTileThemeData lerp(AppListTileThemeData? other, double t) {
    if (other is! AppListTileThemeData) {
      return this;
    }
    return AppListTileThemeData(
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      splashColor: Color.lerp(splashColor, other.splashColor, t),
    );
  }

  // Optional
  @override
  String toString() =>
      'AppListTileThemeData(foregroundColor: $foregroundColor, backgroundColor: $backgroundColor)';
}
