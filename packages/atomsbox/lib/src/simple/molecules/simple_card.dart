import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_card_container.dart';
import '../atoms/simple_image.dart';
import '../atoms/simple_text.dart';

class SimpleCard extends StatefulWidget {
  const SimpleCard({
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
  final SimpleImage? image;
  final SimpleImage? hoverImage;

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

  @override
  void initState() {
    super.initState();
    hovered = false;
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

  InkWell _buildSimpleCardExpanded(BuildContext context, bool hovered) {
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

    return InkWell(
      borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (hovered && widget.hoverImage != null)
              ? widget.hoverImage!
              : (widget.image != null)
                  ? widget.image!
                  : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(SimpleConstants.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  maxLines: 2,
                  style: headlineStyle.copyWith(
                    fontSize: (widget.width! < 200)
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
                          fontSize: (widget.width! < 200)
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
        ],
      ),
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
            (widget.image != null)
                ? Positioned.fill(child: widget.image!)
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
