import 'package:flutter/material.dart';

import '../../../atomsbox.dart';

class SimpleCardUser extends StatelessWidget {
  const SimpleCardUser({
    super.key,
    this.onTap,
    this.actions,
    required this.headline,
    this.subhead,
    this.supportingText,
    this.imageUrl,
    this.backgroundImageUrl,
    this.width = 400,
    this.height = 200,
    this.margin,
    this.type = SimpleCardType.elevated,
    this.dense = true,
  });

  // Actions
  final Function()? onTap;
  final Widget? actions;

  // Content
  final Widget headline;
  final String? subhead;
  final String? supportingText;
  final String? imageUrl;
  final String? backgroundImageUrl;

  // Layout
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final SimpleCardType type;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final widget = dense
        ? _buildSimpleCardUserDense(context)
        : _buildSimpleCardUserExpanded(context);

    return SimpleCard.elevated(
      height: height,
      width: width,
      child: widget,
    );
  }

  LayoutBuilder _buildSimpleCardUserExpanded(BuildContext context) {
    final TextStyle headlineStyle = Theme.of(context).textTheme.headlineMedium!;
    final TextStyle subheadStyle = Theme.of(context).textTheme.bodyMedium!;
    final TextStyle supportingTextStyle =
        Theme.of(context).textTheme.bodyMedium!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxHeight * 0.2;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
              ),
              height: constraints.maxHeight * 0.4,
              width: double.infinity,
              child: Transform.translate(
                offset: Offset(0, radius * 0.8),
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: CircleAvatar(
                    radius: radius * 0.95,
                    backgroundImage: NetworkImage(imageUrl ?? ''),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: radius * 0.8),
              padding: const EdgeInsets.all(SimpleConstants.sm),
              width: constraints.maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  (actions != null) ? actions! : const SizedBox(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  SizedBox _buildSimpleCardUserDense(BuildContext context) {
    // TODO: Add a dense version of the SimpleUserCard
    return const SizedBox();
  }
}
