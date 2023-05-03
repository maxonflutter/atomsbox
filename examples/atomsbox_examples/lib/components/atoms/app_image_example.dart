import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppImageExample extends StatelessWidget {
  const AppImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
