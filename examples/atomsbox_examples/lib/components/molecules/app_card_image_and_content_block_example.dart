import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppCardImageAndContentBlockExample extends StatelessWidget {
  const AppCardImageAndContentBlockExample({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppCardImageAndContentBlock(
          margin: const EdgeInsets.only(bottom: AppConstants.sm),
          headline: AppText('This is a card'),
          subhead: sampleText,
          actions: [
            AppFilledButton(onPressed: () {}, child: AppText('Action 1')),
            AppFilledButton.gradient(
                onPressed: () {}, child: AppText('Action 2')),
          ],
        ),
        AppCardImageAndContentBlock(
          type: AppCardType.elevated,
          margin: const EdgeInsets.only(bottom: AppConstants.sm),
          headline: AppText('This is a card'),
          // subhead: sampleText,
          supportingText: sampleText,
          actions: [
            AppFilledButton(onPressed: () {}, child: AppText('Action 1')),
            AppIconButton.gradient(
              onPressed: () {},
              child: const Icon(Icons.offline_bolt),
            ),
          ],
        ),
        AppCardImageAndContentBlock(
          onTap: () {},
          margin: const EdgeInsets.only(bottom: AppConstants.sm),
          headline: AppText('This is a card'),
          subhead: sampleText,
          image: AppImage.network(
            imageUrl,
            height: 150,
            width: double.infinity,
          ),
        ),
        AppCardImageAndContentBlock(
          type: AppCardType.elevated,
          onTap: () {},
          margin: const EdgeInsets.only(bottom: AppConstants.sm),
          headline: AppText('This is a card'),
          subhead: sampleText,
          image: AppImage.network(
            imageUrl,
            height: 150,
            width: double.infinity,
          ),
        ),
        AppCardImageAndContentBlock(
          type: AppCardType.outlined,
          margin: const EdgeInsets.only(bottom: AppConstants.sm),
          headline: AppText('This is a card'),
          // subhead: sampleText,
          supportingText: sampleText,
          actions: [
            AppIconButton(
              onPressed: () {},
              child: const Icon(Icons.offline_bolt),
            ),
            AppFilledButton.gradient(
              onPressed: () {},
              child: AppText('Action 1'),
            ),
          ],
        ),
        AppCardImageAndContentBlock(
          type: AppCardType.outlined,
          onTap: () {},
          margin: const EdgeInsets.only(bottom: AppConstants.sm),
          headline: AppText('This is a card'),
          subhead: sampleText,
          image: AppImage.network(
            imageUrl,
            height: 150,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
