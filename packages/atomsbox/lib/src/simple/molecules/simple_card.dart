import 'package:flutter/material.dart';

import '../atoms/config/simple_app_theme.dart';
import '../atoms/config/simple_constants.dart';
import '../atoms/simple_image.dart';
import '../atoms/simple_label.dart';
import '../atoms/simple_text.dart';

/// A simple card widget with various configurations.
///
/// The [SimpleCard] widget displays an image, title, and optionally a paragraph,
/// tagline, label text, and label icon. The card can be either dense or expanded,
/// and it can respond to tap events.
///
/// This widget is suitable for displaying a small amount of information in a
/// card format, such as a news article, product, or any other content that can
/// be displayed with an image and a few text components.
///
/// See also:
///
///  * [SimpleImage], which is used to display the image on the card.
///  * [SimpleText], which is used to display the title, tagline, and paragraph.
///  * [SimpleLabel], which is used to display the label text and label icon.
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

  /// The URL of the image to display on the card.
  final String imageUrl;

  /// The title of the card.
  final String title;

  /// The optional paragraph text to display on the card.
  final String? paragraph;

  /// The optional tagline text to display on the card.
  final String? tagline;

  /// The optional label text to display on the card.
  final String? labelText;

  /// The optional label icon to display on the card.
  final IconData? labelIcon;

  /// The width of the card.
  final double width;

  /// The height of the card.
  final double height;

  /// Whether to use a dense layout for the card.
  ///
  /// When true, the card will have a smaller height and the paragraph will
  /// not be displayed. Defaults to true.
  final bool dense;

  /// An optional callback that is called when the card is tapped.
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

    return dense
        ? _buildSimpleCardDense(
            context,
            size,
            _image,
            _tagline,
            _title,
            _chip,
          )
        : _buildSimpleCardExpanded(
            context,
            width,
            _image,
            _tagline,
            _title,
            _paragraph,
          );
  }

  Container _buildSimpleCardExpanded(
    context,
    width,
    _image,
    _tagline,
    _title,
    _paragraph,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: Theme.of(context).colorScheme.surface,
      ),
      width: width,
      child: Material(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: _image),
              Padding(
                padding: const EdgeInsets.all(SimpleConstants.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...(tagline != null) ? [_tagline] : [const SizedBox()],
                    _title,
                    ...(paragraph != null)
                        ? [
                            _paragraph,
                          ]
                        : [const SizedBox()],
                  ],
                ),
              )
            ],
          ),
        ),
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
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(SimpleConstants.borderRadius),
                onTap: onTap,
              ),
            ),
          ),
          Positioned(
            bottom: SimpleConstants.md,
            left: SimpleConstants.md,
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
                  left: SimpleConstants.md,
                  top: SimpleConstants.md,
                  child: _chip,
                )
              : Container(),
        ],
      ),
    );
  }
}
