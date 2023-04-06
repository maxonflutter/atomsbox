import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_image.dart';
import '../atoms/simple_text.dart';
import '../atoms/simple_card_container.dart';

class SimpleCard extends StatefulWidget {
  const SimpleCard({
    super.key,
    this.onTap,
    this.actions,
    required this.headline,
    this.subhead,
    this.supportingText,
    this.imageUrl,
    this.hoverImageUrl,
    this.width = 400,
    this.height = 200,
    this.margin,
    this.type = SimpleCardContainerType.elevated,
    this.dense = true,
  });

  // Actions
  final Function()? onTap;
  final List<Widget>? actions;

  // Content
  final Widget headline;
  final String? subhead;
  final String? supportingText;
  final String? imageUrl;
  final String? hoverImageUrl;

  // Layout
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final SimpleCardContainerType type;
  final bool dense;

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  late bool hovered;

  Image? image;
  Image? hoverImage;

  @override
  void initState() {
    super.initState();

    hovered = false;

    if (widget.imageUrl != null) {
      image = Image.network(
        widget.imageUrl!,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    if (widget.hoverImageUrl != null) {
      hoverImage = Image.network(
        widget.hoverImageUrl!,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.imageUrl != null) {
      precacheImage(image!.image, context);
    }

    if (widget.hoverImageUrl != null) {
      precacheImage(hoverImage!.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        hovered ? Theme.of(context).colorScheme.secondary : null;

    final card = widget.dense
        ? _buildSimpleCardDense(context)
        : _buildSimpleCardExpanded(context, hovered);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (event) => setState(() => hovered = true),
      onExit: (event) => setState(() => hovered = false),
      child: (widget.type == SimpleCardContainerType.elevated)
          ? SimpleCardContainer.elevated(
              height: widget.height,
              width: widget.width,
              color: backgroundColor,
              margin: widget.margin ?? EdgeInsets.zero,
              child: card,
            )
          : (widget.type == SimpleCardContainerType.filled)
              ? SimpleCardContainer.filled(
                  height: widget.height,
                  width: widget.width,
                  color: backgroundColor,
                  margin: widget.margin ?? EdgeInsets.zero,
                  child: card,
                )
              : SimpleCardContainer.outlined(
                  height: widget.height,
                  width: widget.width,
                  color: backgroundColor,
                  margin: widget.margin ?? EdgeInsets.zero,
                  child: card,
                ),
    );
  }

  LayoutBuilder _buildSimpleCardExpanded(BuildContext context, bool hovered) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final headlineStyle = textTheme.headlineMedium!.copyWith(
      color: hovered ? colorScheme.onSecondary : null,
    );

    final supportingTextStyle = textTheme.bodyMedium!.copyWith(
      color: hovered ? colorScheme.onSecondary : null,
    );

    final subheadStyle = textTheme.bodyMedium!.copyWith(
      color: hovered ? colorScheme.onSecondary : colorScheme.secondary,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              (hovered && widget.hoverImageUrl != null)
                  ? Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          SimpleConstants.borderRadius,
                        ),
                        child: hoverImage!,
                      ),
                    )
                  : (widget.imageUrl != null)
                      ? Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              SimpleConstants.borderRadius,
                            ),
                            child: image!,
                          ),
                        )
                      : const SizedBox(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(SimpleConstants.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: headlineStyle.copyWith(
                          fontSize: (constraints.maxWidth < 200)
                              ? headlineStyle.fontSize! * 0.75
                              : headlineStyle.fontSize!,
                        ),
                        child: widget.headline,
                      ),
                      (widget.subhead != null)
                          ? DefaultTextStyle(
                              style: subheadStyle,
                              child: SimpleText(
                                widget.subhead!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: SimpleConstants.sm),
                      (widget.supportingText != null)
                          ? DefaultTextStyle(
                              style: supportingTextStyle.copyWith(
                                fontSize: (constraints.maxWidth < 200)
                                    ? supportingTextStyle.fontSize! * 0.8
                                    : supportingTextStyle.fontSize!,
                              ),
                              child: SimpleText(
                                widget.supportingText!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  LayoutBuilder _buildSimpleCardDense(BuildContext context) {
    final TextStyle headlineStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);
    final TextStyle subheadStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            (widget.imageUrl != null)
                ? Positioned.fill(
                    child: SimpleImage(height: 200, widget.imageUrl!),
                  )
                : const SizedBox(),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SimpleConstants.borderRadius),
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
                  onTap: widget.onTap,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                padding: const EdgeInsets.all(SimpleConstants.md),
                width: constraints.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: headlineStyle.copyWith(
                        fontSize: (constraints.maxWidth < 200)
                            ? headlineStyle.fontSize! * 0.75
                            : headlineStyle.fontSize!,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      child: widget.headline,
                    ),
                    (widget.subhead != null)
                        ? DefaultTextStyle(
                            style: subheadStyle.copyWith(
                              fontSize: (constraints.maxWidth < 200)
                                  ? subheadStyle.fontSize! * 0.75
                                  : subheadStyle.fontSize!,
                            ),
                            child: SimpleText(
                              widget.subhead!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
