import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppCountdownExample extends StatelessWidget {
  const AppCountdownExample({super.key});

  @override
  Widget build(BuildContext context) {
    final deadline = DateTime.now().add(
      const Duration(days: 2),
    );
    return Scaffold(
      appBar: const ExampleAppBar(),
      body: SizedBox(
        height: 200,
        child: Center(
          child: AppCountdown(deadline: deadline),
        ),
      ),
    );
  }
}
