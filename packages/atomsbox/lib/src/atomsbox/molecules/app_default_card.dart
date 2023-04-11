import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';

/// A customizable card widget with hover effect and optional content.
///
/// The [AppDefaultCard] is a versatile card widget that can be used to display
/// various types of content, including a headline, subhead, supporting text, image,
/// and hover image. It also has an optional list of actions.
///
/// The layout, styling, and behavior of the card can be customized using the
/// provided properties.
///
/// It supports three card types: filled, elevated, and outlined.
class AppDefaultCard extends StatefulWidget {
  /// Creates a customizable card widget.
  ///
  /// The [headline] parameter must not be null.
  /// The [type] parameter defaults to [AppCardType.filled].

  const AppDefaultCard({
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

  /// An optional callback function that is triggered when the card is tapped.
  final Function()? onTap;

  /// An optional list of action widgets to be displayed on the card.
  final List<Widget>? actions;

  /// The main content of the card, usually a text widget representing the headline.
  final Widget headline;

  /// An optional subheading displayed below the headline.
  final String? subhead;

  /// An optional supporting text displayed below the subheading.
  final String? supportingText;

  /// An optional image to be displayed above the content.
  final Image? image;

  /// An optional hover image to be displayed when the card is hovered.
  final Image? hoverImage;

  /// The width of the card, defaults to double.infinity.
  final double? width;

  /// The height of the card.
  final double? height;

  /// The margin around the card.
  final EdgeInsets? margin;

  /// The card type, which determines its appearance. Defaults to [AppCardType.filled].
  final AppCardType type;
  @override
  State<AppDefaultCard> createState() => _AppDefaultCardState();
}

class _AppDefaultCardState extends State<AppDefaultCard> {
  late bool hovered;

  @override
  void initState() {
    hovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final card = _buildAppDefaultCard(context, hovered);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (event) => setState(() => hovered = true),
      onExit: (event) => setState(() => hovered = false),
      child: (widget.type == AppCardType.elevated)
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
                ),
    );
  }

  InkWell _buildAppDefaultCard(
    BuildContext context,
    bool hovered,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final headlineStyle = textTheme.headlineSmall!.copyWith(
      color: hovered ? colorScheme.onSecondary : null,
    );

    final subheadStyle = textTheme.bodyLarge!.copyWith(
      color: hovered ? colorScheme.onSecondary : colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    final supportingTextStyle = textTheme.bodyMedium!.copyWith(
      color: hovered ? colorScheme.onSecondary : null,
    );

    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            child: (hovered && widget.hoverImage != null)
                ? widget.hoverImage!
                : (widget.image != null)
                    ? widget.image!
                    : const SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppConstants.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  maxLines: 1,
                  style:
                      headlineStyle.copyWith(fontSize: headlineStyle.fontSize),
                  child: widget.headline,
                ),
                (widget.subhead != null)
                    ? DefaultTextStyle(
                        style: subheadStyle,
                        child: AppText(
                          widget.subhead!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: AppConstants.sm),
                (widget.supportingText != null)
                    ? DefaultTextStyle(
                        style: supportingTextStyle.copyWith(
                            fontSize: supportingTextStyle.fontSize),
                        child: AppText(
                          widget.supportingText!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox(),
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
