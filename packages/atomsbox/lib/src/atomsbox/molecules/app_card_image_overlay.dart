import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import 'app_text_block.dart';

class AppCardImageOverlay extends StatelessWidget {
  const AppCardImageOverlay({
    super.key,
    this.onTap,
    this.actions,
    required this.headline,
    required this.image,
    this.subhead,
    this.supportingText,
    this.width = double.infinity,
    this.height,
    this.margin,
    this.type = AppCardType.filled,
  });

  final Function()? onTap;
  final List<Widget>? actions;
  final Image image;
  final Widget headline;
  final String? subhead;
  final String? supportingText;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final AppCardType type;

  @override
  Widget build(BuildContext context) {
    final card = _buildAppCardImageOverlay(context);

    return (type == AppCardType.elevated)
        ? AppCard.elevated(
            height: height,
            width: width,
            margin: margin ?? EdgeInsets.zero,
            child: card,
          )
        : (type == AppCardType.filled)
            ? AppCard.filled(
                height: height,
                width: width,
                margin: margin ?? EdgeInsets.zero,
                child: card,
              )
            : AppCard.outlined(
                height: height,
                width: width,
                margin: margin ?? EdgeInsets.zero,
                child: card,
              );
  }

  InkWell _buildAppCardImageOverlay(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            child: image,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.5, 1.0],
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: AppConstants.sm,
            bottom: AppConstants.sm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextBlock(
                  title: headline,
                  subtitle: (subhead != null) ? AppText(subhead!) : null,
                  supportingText: (supportingText != null)
                      ? AppText(supportingText!)
                      : null,
                ),
                Row(
                  children: (actions == null)
                      ? []
                      : actions!
                          .map(
                            (action) => Container(
                              margin: const EdgeInsets.only(
                                top: AppConstants.sm,
                                right: AppConstants.sm,
                              ),
                              child: action,
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
