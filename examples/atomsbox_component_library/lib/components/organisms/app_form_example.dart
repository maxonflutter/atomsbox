import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppFormExample extends StatelessWidget {
  const AppFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExampleAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
