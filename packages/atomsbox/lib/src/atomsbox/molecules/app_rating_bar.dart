import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'app_text_block.dart';
import '../atoms/config/app_constants.dart';

/// A custom app rating bar widget.
///
/// The [AppRatingBar] widget displays a customizable rating bar that can be used
/// to rate items in the app. The rating bar consists of a series of icons, such as
/// stars, that represent the rating. The rating can be updated by tapping or
/// dragging the icons. Additional widgets, such as a title, description, and
/// labels, can also be displayed along with the rating bar.
///
/// The [ratingWidget] is an optional parameter, which allows you to customize the
/// appearance of the rating icons. If not provided, a default star rating widget
/// will be used.
///
/// The [onRatingUpdate] callback is required and is called when the rating is
/// updated by the user.
///
/// The [maxRating], [minRating], [initialRating], and [itemCount] properties are
/// used to configure the rating scale, while the [itemSize] and [itemPadding]
/// properties control the appearance of the rating icons.
///
/// The [direction] property controls the orientation of the rating bar, either
/// horizontal or vertical.
///
/// The [ignoreGestures], [tapOnlyMode], and [updateOnDrag] properties can be used
/// to configure how the rating is updated in response to user input.
///
/// The [wrapAlignment] property controls the alignment of the rating bar within
/// its parent container.
///
/// The [title], [description], [labelLow], and [labelHigh] properties are optional
/// and can be used to display additional information about the rating bar.

class AppRatingBar extends StatelessWidget {
  /// Creates an app rating bar widget.
  ///
  /// The [onRatingUpdate] callback must be provided and is called when the rating
  /// is updated.
  ///
  /// The [itemCount], [initialRating], [itemSize], and [itemPadding] properties
  /// have default values, but can be overridden if desired.

  const AppRatingBar({
    super.key,
    this.ratingWidget,
    required this.onRatingUpdate,
    this.maxRating,
    this.textDirection,
    this.unratedColor,
    this.allowHalfRating = true,
    this.direction = Axis.horizontal,
    this.ignoreGestures = false,
    this.initialRating = 2,
    this.itemCount = 5,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: AppConstants.sm),
    this.itemSize = 30.0,
    this.minRating = 0,
    this.tapOnlyMode = false,
    this.updateOnDrag = false,
    this.wrapAlignment = WrapAlignment.start,
    this.title,
    this.description,
    this.labelLow,
    this.labelHigh,
  });

  /// The custom rating widget to display. If not provided, a default star rating
  /// widget will be used.
  final RatingWidget? ratingWidget;

  /// The callback that is called when the rating is updated.
  final void Function(double) onRatingUpdate;

  /// The maximum allowed rating value. Defaults to null, which means the rating
  /// scale will be determined by the [itemCount] property.
  final double? maxRating;

  /// The text direction for the rating bar.
  final TextDirection? textDirection;

  /// The color of the unrated icons.
  final Color? unratedColor;

  /// Whether half rating values are allowed. Defaults to true.
  final bool allowHalfRating;

  /// The orientation of the rating bar, either horizontal or vertical.
  /// Defaults to Axis.horizontal.
  final Axis direction;

  /// Whether to ignore user gestures. Defaults to false.
  final bool ignoreGestures;

  /// The initial rating value displayed. Defaults to 2.
  final double initialRating;

  /// The number of rating icons displayed. Defaults to 5.
  final int itemCount;

  /// The padding applied to each rating icon. Defaults to a symmetric horizontal
  /// padding with a value defined by [AppConstants.sm].
  final EdgeInsetsGeometry itemPadding;

  /// The size of each rating icon. Defaults to 30.0.
  final double itemSize;

  /// The minimum allowed rating value. Defaults to 0.
  final double minRating;

  /// Whether to update the rating on tap only. Defaults to false.
  final bool tapOnlyMode;

  /// Whether to update the rating while dragging. Defaults to false.
  final bool updateOnDrag;

  /// The alignment of the rating bar within its parent container.
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment wrapAlignment;

  /// An optional title widget displayed above the rating bar.
  final Widget? title;

  /// An optional description widget displayed below the title and above the rating bar.
  final Widget? description;

  /// An optional label widget displayed at the lower end of the rating bar.
  final Widget? labelLow;

  /// An optional label widget displayed at the higher end of the rating bar.
  final Widget? labelHigh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextBlock(title: title, subtitle: description),
        RatingBar(
          glow: false,
          ignoreGestures: ignoreGestures,
          itemSize: itemSize,
          initialRating: initialRating,
          direction: direction,
          allowHalfRating: allowHalfRating,
          itemCount: itemCount,
          ratingWidget: ratingWidget ??
              RatingWidget(
                full: CustomPaint(
                  painter: FullStarPainter(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: SizedBox(
                    height: itemSize,
                    width: itemSize,
                  ),
                ),
                half: CustomPaint(
                  painter: HalfStarPainter(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: SizedBox(
                    height: itemSize,
                    width: itemSize,
                  ),
                ),
                empty: CustomPaint(
                  painter: EmptyStarPainter(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: SizedBox(
                    height: itemSize,
                    width: itemSize,
                  ),
                ),
              ),
          itemPadding: itemPadding,
          onRatingUpdate: onRatingUpdate,
        ),
        const SizedBox(height: AppConstants.sm),
        SizedBox(
          width: itemSize * itemCount + itemPadding.horizontal * itemCount,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (labelLow != null) labelLow!,
              if (labelHigh != null) labelHigh!,
            ],
          ),
        ),
      ],
    );
  }
}

class FullStarPainter extends CustomPainter {
  const FullStarPainter({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = color;

    path = Path();
    path.lineTo(size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width * 0.68, size.height * 0.3,
        size.width * 0.68, size.height * 0.3);
    path.cubicTo(size.width * 0.68, size.height * 0.3, size.width,
        size.height * 0.38, size.width, size.height * 0.38);
    path.cubicTo(size.width, size.height * 0.38, size.width * 0.79,
        size.height * 0.65, size.width * 0.79, size.height * 0.65);
    path.cubicTo(size.width * 0.79, size.height * 0.65, size.width * 0.81,
        size.height, size.width * 0.81, size.height);
    path.cubicTo(size.width * 0.81, size.height, size.width / 2,
        size.height * 0.87, size.width / 2, size.height * 0.87);
    path.cubicTo(size.width / 2, size.height * 0.87, size.width * 0.19,
        size.height, size.width * 0.19, size.height);
    path.cubicTo(size.width * 0.19, size.height, size.width * 0.22,
        size.height * 0.65, size.width * 0.22, size.height * 0.65);
    path.cubicTo(size.width * 0.22, size.height * 0.65, 0, size.height * 0.38,
        0, size.height * 0.38);
    path.cubicTo(0, size.height * 0.38, size.width / 3, size.height * 0.3,
        size.width / 3, size.height * 0.3);
    path.cubicTo(size.width / 3, size.height * 0.3, size.width / 2, 0,
        size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width / 2, 0, size.width / 2, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class EmptyStarPainter extends CustomPainter {
  const EmptyStarPainter({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = color.withOpacity(0.2);

    path = Path();
    path.lineTo(size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width * 0.68, size.height * 0.3,
        size.width * 0.68, size.height * 0.3);
    path.cubicTo(size.width * 0.68, size.height * 0.3, size.width,
        size.height * 0.38, size.width, size.height * 0.38);
    path.cubicTo(size.width, size.height * 0.38, size.width * 0.79,
        size.height * 0.65, size.width * 0.79, size.height * 0.65);
    path.cubicTo(size.width * 0.79, size.height * 0.65, size.width * 0.81,
        size.height, size.width * 0.81, size.height);
    path.cubicTo(size.width * 0.81, size.height, size.width / 2,
        size.height * 0.87, size.width / 2, size.height * 0.87);
    path.cubicTo(size.width / 2, size.height * 0.87, size.width / 5,
        size.height, size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width * 0.22,
        size.height * 0.65, size.width * 0.22, size.height * 0.65);
    path.cubicTo(size.width * 0.22, size.height * 0.65, 0, size.height * 0.38,
        0, size.height * 0.38);
    path.cubicTo(0, size.height * 0.38, size.width / 3, size.height * 0.3,
        size.width / 3, size.height * 0.3);
    path.cubicTo(size.width / 3, size.height * 0.3, size.width / 2, 0,
        size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width / 2, 0, size.width / 2, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HalfStarPainter extends CustomPainter {
  const HalfStarPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1
    paint.color = color;
    path = Path();
    path.lineTo(size.width * 0.62, size.height / 5);
    path.cubicTo(size.width * 0.62, size.height / 5, size.width / 2, 0,
        size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width * 0.32, size.height * 0.3,
        size.width * 0.32, size.height * 0.3);
    path.cubicTo(size.width * 0.32, size.height * 0.3, 0, size.height * 0.38, 0,
        size.height * 0.38);
    path.cubicTo(0, size.height * 0.38, size.width / 5, size.height * 0.65,
        size.width / 5, size.height * 0.65);
    path.cubicTo(size.width / 5, size.height * 0.65, size.width * 0.19,
        size.height, size.width * 0.19, size.height);
    path.cubicTo(size.width * 0.19, size.height, size.width * 0.31,
        size.height * 0.95, size.width * 0.31, size.height * 0.95);
    path.cubicTo(size.width * 0.31, size.height * 0.95, size.width * 0.62,
        size.height / 5, size.width * 0.62, size.height / 5);
    path.cubicTo(size.width * 0.62, size.height / 5, size.width * 0.62,
        size.height / 5, size.width * 0.62, size.height / 5);
    canvas.drawPath(path, paint);

    // Path number 2
    paint.color = color.withOpacity(0.2);
    path = Path();
    path.lineTo(size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width * 0.68, size.height * 0.3,
        size.width * 0.68, size.height * 0.3);
    path.cubicTo(size.width * 0.68, size.height * 0.3, size.width,
        size.height * 0.38, size.width, size.height * 0.38);
    path.cubicTo(size.width, size.height * 0.38, size.width * 0.78,
        size.height * 0.65, size.width * 0.78, size.height * 0.65);
    path.cubicTo(size.width * 0.78, size.height * 0.65, size.width * 0.81,
        size.height, size.width * 0.81, size.height);
    path.cubicTo(size.width * 0.81, size.height, size.width / 2,
        size.height * 0.87, size.width / 2, size.height * 0.87);
    path.cubicTo(size.width / 2, size.height * 0.87, size.width * 0.19,
        size.height, size.width * 0.19, size.height);
    path.cubicTo(size.width * 0.19, size.height, size.width * 0.22,
        size.height * 0.65, size.width * 0.22, size.height * 0.65);
    path.cubicTo(size.width * 0.22, size.height * 0.65, 0, size.height * 0.38,
        0, size.height * 0.38);
    path.cubicTo(0, size.height * 0.38, size.width * 0.32, size.height * 0.3,
        size.width * 0.32, size.height * 0.3);
    path.cubicTo(size.width * 0.32, size.height * 0.3, size.width / 2, 0,
        size.width / 2, 0);
    path.cubicTo(size.width / 2, 0, size.width / 2, 0, size.width / 2, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
