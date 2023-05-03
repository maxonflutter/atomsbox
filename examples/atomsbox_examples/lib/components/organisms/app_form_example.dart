import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppFormExample extends StatelessWidget {
  const AppFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppForm(
          title: AppText('This is a form'),
          description: AppText('This is a form description'),
          formButton: AppFilledButton(
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
    );
  }
}
