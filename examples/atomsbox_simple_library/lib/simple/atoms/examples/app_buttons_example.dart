import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppButtonsExample extends StatelessWidget {
  const AppButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppElevatedButton(
                    onPressed: () {},
                    child: const Text('Elevated'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppFilledButton(
                    onPressed: () {},
                    child: const Text('Filled'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppTextButton(
                    onPressed: () {},
                    child: const Text('Text'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppOutlinedButton(
                    onPressed: () {},
                    child: const Text('Outlined'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppIconButton(
                    onPressed: () {},
                    child: const Icon(Icons.offline_bolt),
                  ),
                ],
              ),
              const SizedBox(width: AppConstants.sm),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppElevatedButton.secondary(
                    onPressed: () {},
                    child: const Text('Elevated'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppFilledButton.secondary(
                    onPressed: () {},
                    child: const Text('Filled'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppTextButton.secondary(
                    onPressed: () {},
                    child: const Text('Text'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppOutlinedButton.secondary(
                    onPressed: () {},
                    child: const Text('Outlined'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppIconButton.secondary(
                    onPressed: () {},
                    child: const Icon(Icons.offline_bolt),
                  ),
                ],
              ),
              const SizedBox(width: AppConstants.sm),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppElevatedButton.gradient(
                    onPressed: () {},
                    child: const Text('Elevated'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppFilledButton.gradient(
                    onPressed: () {},
                    child: const Text('Filled'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppTextButton.gradient(
                    onPressed: () {},
                    child: const Text('Text'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppOutlinedButton.gradient(
                    onPressed: () {},
                    child: const Text('Outlined'),
                  ),
                  const SizedBox(height: AppConstants.sm),
                  AppIconButton.gradient(
                    onPressed: () {},
                    child: const Icon(Icons.offline_bolt),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.sm),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          Container(
            height: 125,
            width: 400,
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
            child: Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              spacing: AppConstants.sm,
              runSpacing: AppConstants.sm,
              children: [
                AppElevatedButton.glass(
                  onPressed: () {},
                  child: const Text('Elevated '),
                ),
                AppFilledButton.glass(
                  onPressed: () {},
                  child: const Text('Filled'),
                ),
                AppTextButton.glass(
                  onPressed: () {},
                  child: const Text('Text'),
                ),
                AppOutlinedButton.glass(
                  onPressed: () {},
                  child: const Text('Outlined'),
                ),
                AppIconButton.glass(
                  onPressed: () {},
                  child: const Icon(Icons.offline_bolt),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
