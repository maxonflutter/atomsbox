import 'package:flutter/material.dart';

import '../../../atomsbox.dart';

class SimpleCardGeneric extends StatefulWidget {
  const SimpleCardGeneric({
    super.key,
    this.onTap,
    this.actions,
    required this.headline,
    this.subhead,
    this.supportingText,
    this.imageUrl,
    this.width = 400,
    this.height = 200,
    this.margin,
    this.type = SimpleCardType.elevated,
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

  // Layout
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final SimpleCardType type;
  final bool dense;

  @override
  State<SimpleCardGeneric> createState() => _SimpleCardGenericState();
}

class _SimpleCardGenericState extends State<SimpleCardGeneric> {
  late bool hovered;

  @override
  void initState() {
    hovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        hovered ? Theme.of(context).colorScheme.secondary : null;

    final card = widget.dense
        ? _buildSimpleCardGenericDense(context)
        : _buildSimpleCardGenericExpanded(context, hovered);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (event) => setState(() => hovered = true),
      onExit: (event) => setState(() => hovered = false),
      child: (widget.type == SimpleCardType.elevated)
          ? SimpleCard.elevated(
              height: widget.height,
              width: widget.width,
              color: backgroundColor,
              margin: widget.margin ?? EdgeInsets.zero,
              child: card,
            )
          : (widget.type == SimpleCardType.filled)
              ? SimpleCard.filled(
                  height: widget.height,
                  width: widget.width,
                  color: backgroundColor,
                  margin: widget.margin ?? EdgeInsets.zero,
                  child: card,
                )
              : SimpleCard.outlined(
                  height: widget.height,
                  width: widget.width,
                  color: backgroundColor,
                  margin: widget.margin ?? EdgeInsets.zero,
                  child: card,
                ),
    );
  }

  LayoutBuilder _buildSimpleCardGenericExpanded(
    BuildContext context,
    bool hovered,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final headlineStyle = textTheme.headlineMedium!
        .copyWith(color: hovered ? colorScheme.onSecondary : null);
    final subheadStyle = textTheme.bodyMedium!
        .copyWith(color: hovered ? colorScheme.onSecondary : null);
    final supportingTextStyle = textTheme.bodyMedium!
        .copyWith(color: hovered ? colorScheme.onSecondary : null);
    ;

    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              (widget.imageUrl != null)
                  ? SimpleImage(
                      height: 200,
                      width: double.infinity,
                      widget.imageUrl!,
                    )
                  // ? Flexible(child: SimpleImage(height: 200, widget.imageUrl!))
                  : const SizedBox(),
              Padding(
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
              )
            ],
          ),
        );
      },
    );
  }

  LayoutBuilder _buildSimpleCardGenericDense(BuildContext context) {
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
                    child: SimpleImage(height: 200, widget.imageUrl!))
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
