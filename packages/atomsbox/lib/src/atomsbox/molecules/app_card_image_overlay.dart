import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import 'app_text_block.dart';

/// A widget that displays an image with an overlay containing a headline, subhead,
/// and optional supporting text, with optional actions.
///
/// The [AppCardImageOverlay] widget displays an image and overlays it with a
/// gradient, headline, subhead, and optional supporting text. It also supports
/// onTap functionality and a list of actions that can be displayed in the
/// bottom-right corner.
///
/// The image is displayed using the [Image] widget, and the text is displayed
/// using [AppText] and [AppTextBlock] widgets.
///
/// The card can be displayed in three different styles: filled, elevated, or
/// outlined, determined by the [type] property.
///
/// See also:
///
/// * [Image], which displays the image in the widget.
/// * [AppText], which displays the subhead and supporting text.
/// * [AppTextBlock], which displays the headline, subhead, and supporting text.
class AppCardImageOverlay extends StatelessWidget {
  /// Creates an AppCardImageOverlay widget.
  ///
  /// The [headline] and [image] parameters must not be null.
  /// The [type] parameter defaults to [AppCardType.filled] if not provided.
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

  /// The callback that is called when the card is tapped.
  final Function()? onTap;

  /// The list of action widgets to display in the bottom-right corner of the card.
  final List<Widget>? actions;

  /// The image to display as a background.
  final Image image;

  /// The headline text widget to display on the overlay.
  final Widget headline;

  /// The subhead text to display on the overlay.
  final String? subhead;

  /// The supporting text to display on the overlay.
  final String? supportingText;

  /// The width of the card.
  ///
  /// Defaults to [double.infinity].
  final double? width;

  /// The height of the card.
  final double? height;

  /// The margin around the card.
  final EdgeInsets? margin;

  /// The type of card to display.
  ///
  /// Can be [AppCardType.filled], [AppCardType.elevated], or [AppCardType.outlined].
  /// Defaults to [AppCardType.filled].
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

  LayoutBuilder _buildAppCardImageOverlay(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) => InkWell(
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
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius),
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
              child: SizedBox(
                width: (constraints.maxWidth.isFinite)
                    ? constraints.maxWidth - AppConstants.lg
                    : size.width - AppConstants.lg,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextBlock(
                      title: headline,
                      subtitle: (subhead != null)
                          ? AppText(
                              subhead!,
                              color: Theme.of(context).colorScheme.onPrimary,
                            )
                          : null,
                      supportingText: (supportingText != null)
                          ? AppText(
                              supportingText!,
                              color: Theme.of(context).colorScheme.onPrimary,
                            )
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
            ),
          ],
        ),
      ),
    );
  }
}
