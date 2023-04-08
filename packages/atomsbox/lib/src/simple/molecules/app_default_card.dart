import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';

class AppDefaultCard extends StatefulWidget {
  const AppDefaultCard({
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
    this.type = AppCardType.filled,
  });

  // Actions
  final Function()? onTap;
  final List<Widget>? actions;

  // Content
  final Widget headline;
  final String? subhead;
  final String? supportingText;
  final Image? image;
  final Image? hoverImage;

  // Layout
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final AppCardType type;

  @override
  State<AppDefaultCard> createState() => _AppDefaultCardState();
}

class _AppDefaultCardState extends State<AppDefaultCard> {
  late bool hovered;

  @override
  void initState() {
    hovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final card = _buildAppDefaultCard(context, hovered);

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (event) => setState(() => hovered = true),
      onExit: (event) => setState(() => hovered = false),
      child: (widget.type == AppCardType.elevated)
          ? AppCard.elevated(
              height: widget.height,
              width: widget.width,
              color: hovered
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              margin: widget.margin ?? EdgeInsets.zero,
              child: card,
            )
          : (widget.type == AppCardType.filled)
              ? AppCard.filled(
                  height: widget.height,
                  width: widget.width,
                  color: hovered
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.surface,
                  margin: widget.margin ?? EdgeInsets.zero,
                  child: card,
                )
              : AppCard.outlined(
                  height: widget.height,
                  width: widget.width,
                  color: hovered
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.surface,
                  margin: widget.margin ?? EdgeInsets.zero,
                  child: card,
                ),
    );
  }

  InkWell _buildAppDefaultCard(
    BuildContext context,
    bool hovered,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final headlineStyle = textTheme.headlineMedium!.copyWith(
      color: hovered ? colorScheme.onSecondary : null,
    );

    final supportingTextStyle = textTheme.bodySmall!.copyWith(
      color: hovered ? colorScheme.onSecondary : null,
    );

    final subheadStyle = textTheme.bodyMedium!.copyWith(
      color: hovered ? colorScheme.onSecondary : colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            child: (hovered && widget.hoverImage != null)
                ? widget.hoverImage!
                : (widget.image != null)
                    ? widget.image!
                    : const SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppConstants.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  maxLines: 2,
                  style:
                      headlineStyle.copyWith(fontSize: headlineStyle.fontSize),
                  child: widget.headline,
                ),
                (widget.subhead != null)
                    ? DefaultTextStyle(
                        style: subheadStyle,
                        child: AppText(
                          widget.subhead!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: AppConstants.sm),
                (widget.supportingText != null)
                    ? DefaultTextStyle(
                        style: supportingTextStyle.copyWith(
                            fontSize: supportingTextStyle.fontSize),
                        child: AppText(
                          widget.supportingText!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox(),
                Row(
                  children: (widget.actions == null)
                      ? []
                      : widget.actions!
                          .map((action) => Container(
                              margin: const EdgeInsets.only(
                                top: AppConstants.sm,
                                right: AppConstants.sm,
                              ),
                              child: action))
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// LayoutBuilder _buildAppDefaultCardDense(BuildContext context) {
//     final TextStyle headlineStyle = Theme.of(context)
//         .textTheme
//         .headlineMedium!
//         .copyWith(color: Theme.of(context).colorScheme.onPrimary);
//     final TextStyle subheadStyle = Theme.of(context)
//         .textTheme
//         .bodyMedium!
//         .copyWith(color: Theme.of(context).colorScheme.onPrimary);

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Stack(
//           children: [
//             (image != null) ? Positioned.fill(child: image!) : const SizedBox(),
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius:
//                       BorderRadius.circular(AppConstants.borderRadius),
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Theme.of(context).colorScheme.primary.withAlpha(150),
//                       Theme.of(context).colorScheme.primary,
//                     ],
//                     stops: const [0.2, 0.6, 1],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   borderRadius:
//                       BorderRadius.circular(AppConstants.borderRadius),
//                   onTap: onTap,
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               child: Container(
//                 padding: const EdgeInsets.all(AppConstants.md),
//                 width: constraints.maxWidth,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     DefaultTextStyle(
//                       style: headlineStyle.copyWith(
//                         fontSize: (constraints.maxWidth < 200)
//                             ? headlineStyle.fontSize! * 0.75
//                             : headlineStyle.fontSize!,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       child: headline,
//                     ),
//                     (subhead != null)
//                         ? DefaultTextStyle(
//                             style: subheadStyle.copyWith(
//                               fontSize: (constraints.maxWidth < 200)
//                                   ? subheadStyle.fontSize! * 0.75
//                                   : subheadStyle.fontSize!,
//                             ),
//                             child: AppText(
//                               subhead!,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           )
//                         : const SizedBox(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
