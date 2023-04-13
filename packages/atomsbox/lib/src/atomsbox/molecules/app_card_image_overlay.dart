import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import 'app_text_block.dart';

class AppCardImageOverlay extends StatefulWidget {
  const AppCardImageOverlay({
    super.key,
    this.onTap,
    this.actions,
    required this.headline,
    this.subhead,
    this.supportingText,
    this.image,
    this.hoverImage,
    this.width = double.infinity,
    this.height,
    this.margin,
    this.type = AppCardType.filled,
  });

  final Function()? onTap;
  final List<Widget>? actions;
  final Widget headline;
  final String? subhead;
  final String? supportingText;
  final Image? image;
  final Image? hoverImage;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final AppCardType type;

  @override
  State<AppCardImageOverlay> createState() => _AppCardImageOverlayState();
}

class _AppCardImageOverlayState extends State<AppCardImageOverlay> {
  late bool hovered;

  @override
  void initState() {
    hovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final card = _buildAppCardImageOverlay(context, hovered);

    return (widget.type == AppCardType.elevated)
        ? AppCard.elevated(
            height: widget.height,
            width: widget.width,
            color: hovered
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.surface,
            margin: widget.margin ?? EdgeInsets.zero,
            child: card,
          )
        : (widget.type == AppCardType.filled)
            ? AppCard.filled(
                height: widget.height,
                width: widget.width,
                color: hovered
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.surface,
                margin: widget.margin ?? EdgeInsets.zero,
                child: card,
              )
            : AppCard.outlined(
                height: widget.height,
                width: widget.width,
                color: hovered
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.surface,
                margin: widget.margin ?? EdgeInsets.zero,
                child: card,
              );
  }

  InkWell _buildAppCardImageOverlay(
    BuildContext context,
    bool hovered,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      onTap: widget.onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            child: (hovered && widget.hoverImage != null)
                ? widget.hoverImage!
                : (widget.image != null)
                    ? widget.image!
                    : const SizedBox(),
          ),
          Positioned(
            left: AppConstants.sm,
            bottom: AppConstants.sm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextBlock(
                  title: widget.headline,
                  subtitle: (widget.subhead != null)
                      ? AppText(widget.subhead!)
                      : null,
                  supportingText: (widget.supportingText != null)
                      ? AppText(widget.supportingText!)
                      : null,
                ),
                Row(
                  children: (widget.actions == null)
                      ? []
                      : widget.actions!
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
