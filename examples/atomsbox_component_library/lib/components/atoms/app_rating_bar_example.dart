import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppRatingBarExample extends StatelessWidget {
  const AppRatingBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExampleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppRatingBar(
                title: AppText('How was the call?'),
                labelLow: AppText('Very poor'),
                labelHigh: AppText('Excellent'),
                onRatingUpdate: (double value) {
                  print(value);
                },
              ),
            ],
          ),
          const SizedBox(height: AppConstants.xlg),
          AppFilledButton(
            minimumSize: const Size(100, 48),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.all(8.0),
                    child: AppCard.elevated(
                      surfaceTintColor:
                          Theme.of(context).colorScheme.background,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AppIconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.close),
                                )
                              ],
                            ),
                            AppText.headlineMedium('You left the meeting'),
                            const SizedBox(height: AppConstants.lg),
                            AppCard.filled(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                horizontal: AppConstants.sm,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: AppConstants.sm),
                                    AppRatingBar(
                                      description: AppText.bodyMedium(
                                        'How was the quality call?',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      labelLow: AppText.bodySmall('Very poor'),
                                      labelHigh: AppText.bodySmall('Excellent'),
                                      onRatingUpdate: (double value) {
                                        print(value);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: AppConstants.md),
                            AppFilledButton(
                              onPressed: () {},
                              child: AppText('Rejoin'),
                            ),
                            AppTextButton(
                              onPressed: () {},
                              child: AppText('Return to home'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: AppText('Another example'),
          ),
        ],
      ),
    );
  }
}
