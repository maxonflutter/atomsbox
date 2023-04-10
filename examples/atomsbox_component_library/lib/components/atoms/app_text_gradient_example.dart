import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppTextGradientExample extends StatelessWidget {
  const AppTextGradientExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppGradientText(
                child: AppText.displayLarge('This is text'),
              ),
              AppGradientText(
                child: AppText.displayMedium('This is text'),
              ),
              AppGradientText(
                child: AppText.displaySmall('This is text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
