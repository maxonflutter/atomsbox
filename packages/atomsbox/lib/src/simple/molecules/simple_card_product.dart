import 'package:flutter/material.dart';

import '../../../atomsbox.dart';

class SimpleCardGeneric extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final widget = dense
        ? _buildSimpleCardGenericDense(context)
        : _buildSimpleCardGenericExpanded(context);

    if (type == SimpleCardType.elevated) {
      return SimpleCard.elevated(
        height: height,
        width: width,
        margin: margin ?? EdgeInsets.zero,
        child: widget,
      );
    } else if (type == SimpleCardType.filled) {
      return SimpleCard.filled(
        height: height,
        width: width,
        margin: margin ?? EdgeInsets.zero,
        child: widget,
      );
    } else {
      return SimpleCard.outlined(
        height: height,
        width: width,
        margin: margin ?? EdgeInsets.zero,
        child: widget,
      );
    }
  }

  LayoutBuilder _buildSimpleCardGenericExpanded(BuildContext context) {
    final TextStyle headlineStyle = Theme.of(context).textTheme.headlineMedium!;
    final TextStyle subheadStyle = Theme.of(context).textTheme.bodyMedium!;
    final TextStyle supportingTextStyle =
        Theme.of(context).textTheme.bodyMedium!;

    Container();
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              (imageUrl != null)
                  ? Flexible(child: SimpleImage(height: 200, imageUrl!))
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
                      child: headline,
                    ),
                    (subhead != null)
                        ? DefaultTextStyle(
                            style: subheadStyle,
                            child: SimpleText(
                              subhead!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : const SizedBox(),
                    (supportingText != null)
                        ? DefaultTextStyle(
                            style: supportingTextStyle.copyWith(
                              fontSize: (constraints.maxWidth < 200)
                                  ? supportingTextStyle.fontSize! * 0.8
                                  : supportingTextStyle.fontSize!,
                            ),
                            child: SimpleText(
                              supportingText!,
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
            (imageUrl != null)
                ? Positioned.fill(child: SimpleImage(height: 200, imageUrl!))
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
                  onTap: onTap,
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
                      child: headline,
                    ),
                    (subhead != null)
                        ? DefaultTextStyle(
                            style: subheadStyle.copyWith(
                              fontSize: (constraints.maxWidth < 200)
                                  ? subheadStyle.fontSize! * 0.75
                                  : subheadStyle.fontSize!,
                            ),
                            child: SimpleText(
                              subhead!,
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
