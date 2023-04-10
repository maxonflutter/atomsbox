import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppCardExample extends StatelessWidget {
  const AppCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCard.filled(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(AppConstants.xlg),
                child: Center(
                  child: AppText('This is a card'),
                ),
              ),
              AppCard.elevated(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(AppConstants.xlg),
                child: Center(
                  child: AppText('This is a card'),
                ),
              ),

              AppCard.outlined(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(AppConstants.xlg),
                child: Center(
                  child: AppText('This is a card'),
                ),
              ),
              AppCard.gradient(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(AppConstants.xlg),
                child: Center(
                  child: AppText('This is a card'),
                ),
              ),
              // To be displayed on top of a background image.
              AppCard.glass(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(AppConstants.xlg),
                child: Center(
                  child: AppText('This is a card'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
