import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppTabExample extends StatelessWidget {
  const AppTabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTab(
      tabs: [
        Tab(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.code), AppText('Atoms')],
          ),
        ),
        Tab(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.code), AppText('Molecules')],
          ),
        ),
        Tab(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.code), AppText('Organisms')],
          ),
        ),
      ],
      children: [
        Column(
          children: [
            AppCard.elevated(
              height: 300,
              width: double.infinity,
              child: Center(child: AppText('Atoms')),
            ),
          ],
        ),
        Column(
          children: [
            AppCard.elevated(
              height: 300,
              width: double.infinity,
              child: Center(child: AppText('Molecules')),
            ),
          ],
        ),
        Column(
          children: [
            AppCard.elevated(
              height: 300,
              width: double.infinity,
              child: Center(child: AppText('Organisms')),
            ),
          ],
        ),
      ],
    );
  }
}
