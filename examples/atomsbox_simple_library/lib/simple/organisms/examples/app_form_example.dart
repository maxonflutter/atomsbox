import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppFormExample extends StatelessWidget {
  const AppFormExample({super.key});

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
          SimpleForm(
            title: AppText('This is a form'),
            description: AppText('This is a form description'),
            formButton: AppElevatedButton(
              onPressed: () {},
              child: AppText('Submit'),
            ),
            formItemNames: const ['One', 'Two', 'Three'],
            formItems: [
              AppTextFormField(),
              AppTextFormField(),
              AppTextFormField(),
            ],
          ),
        ],
      ),
    );
  }
}
