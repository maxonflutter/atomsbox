import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppTextFormFieldsExample extends StatelessWidget {
  const AppTextFormFieldsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        children: [
          AppTextFormField.filled(labelText: 'Filled'),
          const SizedBox(height: AppConstants.sm),
          AppTextFormField(labelText: 'Underlined'),
          const SizedBox(height: AppConstants.sm),
          AppTextFormField.outlined(labelText: 'Outlined'),
          const SizedBox(height: AppConstants.sm),
          AppTextFormField.gradient(labelText: 'Gradient'),
          const SizedBox(height: AppConstants.sm),
          Container(
            height: 75,
            width: double.infinity,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppTextFormField.glass(
                    labelText: 'Glass',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
