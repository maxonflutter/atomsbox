import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppImageExample extends StatelessWidget {
  const AppImageExample({super.key});

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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.sm),
                child: AppImage.network(
                  'https://images.unsplash.com/photo-1680675313845-13d3f5f17080?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2671&q=80',
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
