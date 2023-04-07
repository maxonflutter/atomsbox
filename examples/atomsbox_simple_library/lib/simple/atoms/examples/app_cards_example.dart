import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppCardsExample extends StatelessWidget {
  const AppCardsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard.filled(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppConstants.sm),
            child: Center(child: AppText('This is a filled card')),
          ),
          AppCard.elevated(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppConstants.sm),
            child: Center(child: AppText('This is an elevated card')),
          ),
          AppCard.outlined(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppConstants.sm),
            child: Center(child: AppText('This is an outlined card')),
          ),
          AppCard.gradient(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppConstants.sm),
            child: Center(child: AppText('This is a card with a gradient BG')),
          ),
          Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppConstants.sm),
            padding: const EdgeInsets.all(AppConstants.sm),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AppImage.network(
                  'https://images.unsplash.com/photo-1680675313845-13d3f5f17080?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2671&q=80',
                  height: 75,
                ).image,
              ),
            ),
            child: AppCard.glass(
              child: Center(child: AppText('This is a glass card')),
            ),
          ),
        ],
      ),
    );
  }
}
