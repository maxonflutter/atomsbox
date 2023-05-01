import 'dart:async';

import 'package:flutter/material.dart';

import '../atoms/app_gradient_text.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';

class AppCountdown extends StatefulWidget {
  const AppCountdown({
    super.key,
    required this.deadline,
    this.textStyle,
    this.labelTextStyle,
    this.useGradient = true,
  });

  final DateTime deadline;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final bool useGradient;

  @override
  State<AppCountdown> createState() => _AppCountdownState();
}

class _AppCountdownState extends State<AppCountdown> {
  late Timer timer;
  Duration duration = const Duration();

  @override
  void initState() {
    calculateTimeLeft(widget.deadline);

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => calculateTimeLeft(widget.deadline),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle =
        widget.textStyle ?? Theme.of(context).textTheme.headlineSmall!;

    var labelTextStyle =
        widget.labelTextStyle ?? Theme.of(context).textTheme.bodyMedium!;

    final hours = DefaultTextStyle(
      style: textStyle,
      child: AppText(
        duration.inHours.toString().padLeft(2, '0'),
      ),
    );

    final minutes = DefaultTextStyle(
      style: textStyle,
      child: AppText(
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
      ),
    );

    final seconds = DefaultTextStyle(
      style: textStyle,
      child: AppText(
        duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.useGradient ? AppGradientText(child: hours) : hours,
            DefaultTextStyle(
              style: labelTextStyle,
              child: AppText('Hours'),
            ),
          ],
        ),
        const SizedBox(width: AppConstants.lg),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.useGradient ? AppGradientText(child: minutes) : minutes,
            DefaultTextStyle(
              style: labelTextStyle,
              child: AppText('Minutes'),
            ),
          ],
        ),
        const SizedBox(width: AppConstants.lg),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.useGradient ? AppGradientText(child: seconds) : seconds,
            DefaultTextStyle(
              style: labelTextStyle,
              child: AppText('Seconds'),
            ),
          ],
        ),
      ],
    );
  }

  void calculateTimeLeft(DateTime deadline) {
    final seconds = deadline.difference(DateTime.now()).inSeconds;
    setState(() => duration = Duration(seconds: seconds));
  }
}
