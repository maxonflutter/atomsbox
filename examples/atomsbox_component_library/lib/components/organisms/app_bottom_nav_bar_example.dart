import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppBottomNavBarExample extends StatelessWidget {
  const AppBottomNavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(),
      bottomNavigationBar: AppBottomNavBar(
        floating: false,
        items: [
          AppBottomNavBarItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () {},
          ),
          AppBottomNavBarItem(
            icon: Icons.search,
            label: 'Search',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AppBottomNavBarExampleTwo(),
                ),
              );
            },
          ),
          AppBottomNavBarItem(icon: Icons.add, label: 'Add'),
        ],
      ),
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.black12),
          )
        ],
      ),
    );
  }
}

class AppBottomNavBarExampleTwo extends StatelessWidget {
  const AppBottomNavBarExampleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(),
      bottomNavigationBar: AppBottomNavBar(
        floating: true,
        items: [
          AppBottomNavBarItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AppBottomNavBarExample(),
                ),
              );
            },
          ),
          AppBottomNavBarItem(
            icon: Icons.search,
            label: 'Search',
            onTap: () {},
          ),
          AppBottomNavBarItem(icon: Icons.add, label: 'Add'),
        ],
      ),
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.black12),
          )
        ],
      ),
    );
  }
}
