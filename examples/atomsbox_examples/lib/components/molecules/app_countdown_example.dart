import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppCountdownExample extends StatelessWidget {
  const AppCountdownExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          AppCountdown(deadline: DateTime.now().add(const Duration(days: 2))),
    );
  }
}
