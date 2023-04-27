import 'dart:async';

import 'package:flutter/material.dart';

import '../atoms/app_gradient_text.dart';
import '../atoms/app_text.dart';

class AppCountdown extends StatefulWidget {
  const AppCountdown({super.key, required this.deadline});

  final DateTime deadline;

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            AppGradientText(
              child: AppText.headlineSmall('${duration.inHours}'),
            ),
            AppText('Hours'),
          ],
        ),
        const VerticalDivider(),
        Column(
          children: [
            AppGradientText(
              child: AppText.headlineSmall(
                duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
              ),
            ),
            AppText('Minutes'),
          ],
        ),
        const VerticalDivider(),
        Column(
          children: [
            AppGradientText(
              child: AppText.headlineSmall(
                duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
              ),
            ),
            AppText('Seconds'),
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
