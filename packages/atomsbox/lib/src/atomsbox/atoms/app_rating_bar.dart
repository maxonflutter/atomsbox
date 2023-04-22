import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../molecules/app_text_block.dart';
import 'config/app_constants.dart';

class AppRatingBar extends StatelessWidget {
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

  final RatingWidget? ratingWidget;
  final void Function(double) onRatingUpdate;
  final double? maxRating;
  final TextDirection? textDirection;
  final Color? unratedColor;
  final bool allowHalfRating;
  final Axis direction;
  final bool ignoreGestures;
  final double initialRating;
  final int itemCount;
  final EdgeInsetsGeometry itemPadding;
  final double itemSize;
  final double minRating;
  final bool tapOnlyMode;
  final bool updateOnDrag;
  final WrapAlignment wrapAlignment;
  final Widget? title;
  final Widget? description;
  final Widget? labelLow;
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
