import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppSearchWithAutocompleteExample extends StatelessWidget {
  const AppSearchWithAutocompleteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ExampleAppBar(),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.sm),
        child: Center(
          child: AppSearchWithAutocomplete(
            options: ['One', 'Two', 'Three', 'Four', 'Five', 'Six'],
          ),
        ),
      ),
    );
  }
}
