import 'package:flutter/material.dart';

import '../../../atomsbox.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.byLine,
    this.paragraph,
    this.imageUrl,
    this.width = 400,
    this.height = 200,
    this.dense = true,
  });

  final Function()? onTap;
  final Widget title;
  final String? subtitle;
  final String? byLine;
  final String? paragraph;
  final String? imageUrl;
  final double? width;
  final double? height;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final widget = dense
        ? _buildSimpleCardDense(context)
        : _buildSimpleCardExpanded(context);

    return _BaseCard.elevated(
      height: height,
      width: width,
      child: widget,
    );
  }

  LayoutBuilder _buildSimpleCardExpanded(BuildContext context) {
    final TextStyle titleStyle = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle paragraphStyle = Theme.of(context).textTheme.bodyMedium!;

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
                    (byLine != null)
                        ? DefaultTextStyle(
                            style: paragraphStyle,
                            child: SimpleText(byLine!, maxLines: 3),
                          )
                        : const SizedBox(),
                    DefaultTextStyle(
                        style: titleStyle.copyWith(
                          fontSize: (constraints.maxWidth < 200)
                              ? titleStyle.fontSize! * 0.75
                              : titleStyle.fontSize!,
                        ),
                        child: title),
                    (paragraph != null)
                        ? DefaultTextStyle(
                            style: paragraphStyle.copyWith(
                              fontSize: (constraints.maxWidth < 200)
                                  ? paragraphStyle.fontSize! * 0.8
                                  : paragraphStyle.fontSize!,
                            ),
                            child: SimpleText(paragraph!, maxLines: 3),
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

  LayoutBuilder _buildSimpleCardDense(BuildContext context) {
    final TextStyle titleStyle = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);
    final TextStyle subtitleStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);

    return LayoutBuilder(builder: (context, constraints) {
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
                    style: titleStyle.copyWith(
                      fontSize: (constraints.maxWidth < 200)
                          ? titleStyle.fontSize! * 0.75
                          : titleStyle.fontSize!,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    child: title,
                  ),
                  (subtitle != null)
                      ? DefaultTextStyle(
                          style: subtitleStyle.copyWith(
                            fontSize: (constraints.maxWidth < 200)
                                ? subtitleStyle.fontSize! * 0.75
                                : subtitleStyle.fontSize!,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          child: SimpleText(subtitle!),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              padding: const EdgeInsets.all(SimpleConstants.md),
              child: const SimpleLabel(text: 'Text', icon: Icons.code),
            ),
          ),
        ],
      );
    });
  }
}

final simpleCardThemeLight = CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
);

final simpleCardThemeDark = CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
  ),
);

typedef CardBuilder = Card Function(BuildContext context);

class _BaseCard extends StatelessWidget {
  _BaseCard.elevated({
    super.key,
    this.color,
    this.margin,
    this.elevation = 4.0,
    this.width = 400,
    this.height = 200,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surface,
        elevation: elevation,
        child: SizedBox(width: width, height: height, child: child),
      );
    };
  }

  _BaseCard.filled({
    super.key,
    this.color,
    this.margin,
    this.elevation = 0.0,
    this.width = 400,
    this.height = 200,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surfaceVariant,
        child: SizedBox(width: width, height: height, child: child),
      );
    };
  }

  _BaseCard.outlined({
    super.key,
    this.color,
    this.margin,
    this.elevation,
    this.width = 400,
    this.height = 100,
    required this.child,
  }) {
    builder = (context) {
      return Card(
        margin: margin ?? EdgeInsets.zero,
        color: color ?? Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
        ),
        child: SizedBox(width: width, height: height, child: child),
      );
    };
  }

  late CardBuilder builder;
  final Color? color;
  final EdgeInsets? margin;
  final double? elevation;
  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Card card = builder.call(context);
    return card;
  }
}
