import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';
import '../atoms/app_text.dart';
import '../atoms/app_card.dart';

class UserCard extends StatelessWidget {
  const UserCard({
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
    this.type = AppCardType.elevated,
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
  final AppCardType type;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final widget =
        dense ? _buildUserCardDense(context) : _buildUserCardExpanded(context);

    return (type == AppCardType.elevated)
        ? AppCard.elevated(
            height: height,
            width: width,
            margin: margin ?? EdgeInsets.zero,
            child: widget,
          )
        : (type == AppCardType.filled)
            ? AppCard.filled(
                height: height,
                width: width,
                margin: margin ?? EdgeInsets.zero,
                child: widget,
              )
            : AppCard.outlined(
                height: height,
                width: width,
                margin: margin ?? EdgeInsets.zero,
                child: widget,
              );
  }

  LayoutBuilder _buildUserCardExpanded(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final headlineStyle = textTheme.headlineMedium!;
    final supportingTextStyle = textTheme.bodyMedium!;

    final subheadStyle = textTheme.bodyMedium!.copyWith(
      color: colorScheme.secondary,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxHeight * 0.2;

        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: (backgroundImageUrl == null)
                    ? null
                    : DecorationImage(
                        image: NetworkImage(backgroundImageUrl!),
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
              margin: EdgeInsets.only(bottom: radius * 0.8),
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppConstants.sm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextStyle(
                      textAlign: TextAlign.center,
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
                            textAlign: TextAlign.center,
                            child: AppText(
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
                            child: AppText(
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
            ),
          ],
        );
      },
    );
  }

  SizedBox _buildUserCardDense(BuildContext context) {
    // TODO: Add a dense version of the UserCard
    return const SizedBox();
  }
}