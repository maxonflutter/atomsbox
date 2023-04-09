import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppSearchWithAutocompleteExample extends StatelessWidget {
  const AppSearchWithAutocompleteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText('atomsbox'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              },
              icon: const Icon(Icons.light_mode),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AppSearchWithAutocomplete()],
          ),
        ),
      ),
    );
  }
}
