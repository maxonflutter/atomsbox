import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppSearchWithAutocompleteExample extends StatelessWidget {
  const AppSearchWithAutocompleteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppSearchWithAutocomplete(
        options: ['One', 'Two', 'Three', 'Four', 'Five', 'Six'],
      ),
    );
  }
}
