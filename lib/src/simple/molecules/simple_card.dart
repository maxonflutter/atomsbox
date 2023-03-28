import 'package:flutter/material.dart';

import '../atoms/simple_app_theme.dart';
import '../atoms/simple_constants.dart';
import '../atoms/simple_image.dart';
import '../atoms/simple_label.dart';
import '../atoms/simple_text.dart';

/// A simple card that displays an image, title, tagline, and optional paragraph and label.
///
/// The [SimpleCard] widget is a simple way to display a card with an image and some text.
/// It is designed to be used as a clickable component that can respond to user interaction
/// through the [onTap] property. The card can be displayed in either a dense or expanded mode.
///
/// The [imageUrl], [title], and [height] properties are required. The [paragraph], [tagline],
/// [labelText], and [labelIcon] properties are optional. If [dense] is set to true, the card
/// will be displayed in a condensed format with a gradient overlay over the image and the title
/// and tagline displayed in the bottom left corner. If [dense] is set to false, the card will be
/// displayed in an expanded format with the image displayed above the title, tagline, and
/// paragraph (if provided).
///
/// If [onTap] is provided, the card will respond to user interaction by calling the callback
/// when the card is clicked or tapped.
///
class SimpleCard extends StatelessWidget {
  const SimpleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.paragraph,
    this.tagline,
    this.labelText,
    this.labelIcon,
    this.width = double.infinity,
    this.height = 400,
    this.dense = true,
    this.onTap,
  });

  /// The URL of the image to be displayed in the card.
  final String imageUrl;

  /// The title to be displayed in the card.
  final String title;

  /// An optional paragraph to be displayed in the card.
  final String? paragraph;

  /// An optional tagline to be displayed in the card.
  final String? tagline;

  /// An optional label text to be displayed in the card.
  final String? labelText;

  /// An optional icon to be displayed next to the label text in the card.
  final IconData? labelIcon;

  /// The width of the card.
  ///
  /// By default, the card will expand to fill the available width.
  final double width;

  /// The height of the card.
  final double height;

  /// Whether the card should be displayed in a dense or expanded format.
  ///
  /// If true, the card will be displayed in a condensed format with a gradient overlay
  /// over the image and the title and tagline displayed in the bottom left corner. If
  /// false, the card will be displayed in an expanded format with the image displayed
  /// above the title, tagline, and paragraph (if provided).
  final bool dense;

  /// A callback that will be called when the card is clicked or tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var _image;
    var _title;
    var _paragraph;
    var _tagline;
    var _chip;

    _image = SimpleImage(
      imageUrl: imageUrl,
      width: width,
      height: 150,
    );

    _title = SimpleText(
      title,
      maxLines: 2,
      color: dense ? Theme.of(context).colorScheme.onPrimary : null,
      textStyle: TextStyleEnum.headlineSmall,
    );

    if (tagline != null) {
      _tagline = SimpleText(
        tagline!,
        color: dense ? Theme.of(context).colorScheme.onPrimary : null,
        textStyle: TextStyleEnum.bodyMedium,
      );
    }

    if (paragraph != null) {
      _paragraph = SimpleText(
        paragraph!,
        maxLines: 3,
        textStyle: TextStyleEnum.bodyMedium,
      );
    }

    if (labelText != null && labelIcon != null) {
      _chip = SimpleLabel(
        text: labelText!,
        icon: labelIcon!,
        colorPalette: ColorPalette.primaryContainer,
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      onTap: onTap,
      child: dense
          ? _buildSimpleCardDense(
              context,
              size,
              _image,
              _tagline,
              _title,
              _chip,
            )
          : _buildSimpleCardExpanded(
              width,
              _image,
              _tagline,
              _title,
              _paragraph,
            ),
    );
  }

  SizedBox _buildSimpleCardExpanded(
    width,
    _image,
    _tagline,
    _title,
    _paragraph,
  ) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: _image),
          const SizedBox(height: SimpleConstants.sm),
          ...(tagline != null)
              ? [_tagline, const SizedBox(height: SimpleConstants.sm)]
              : [const SizedBox()],
          _title,
          const SizedBox(height: SimpleConstants.sm),
          ...(paragraph != null)
              ? [_paragraph, const SizedBox(height: SimpleConstants.sm)]
              : [const SizedBox()],
        ],
      ),
    );
  }

  SizedBox _buildSimpleCardDense(
    BuildContext context,
    Size size,
    _image,
    _tagline,
    _title,
    _chip,
  ) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(child: _image),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SimpleConstants.borderRadius,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.primary.withAlpha(150),
                    Theme.of(context).colorScheme.primary,
                  ],
                  stops: const [0.2, 0.6, 1],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: SimpleConstants.lg,
            left: SimpleConstants.lg,
            child: SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (tagline != null) ? _tagline : const SizedBox(),
                  _title,
                ],
              ),
            ),
          ),
          (labelText != null)
              ? Positioned(
                  left: SimpleConstants.lg,
                  top: SimpleConstants.lg,
                  child: _chip,
                )
              : Container(),
        ],
      ),
    );
  }
}
