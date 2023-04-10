import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppTabExample extends StatelessWidget {
  const AppTabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: AppTab(
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
            ),
          ),
        ),
      ),
    );
  }
}
