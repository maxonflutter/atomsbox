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
            title: 'Home',
            onTap: () {},
          ),
          AppBottomNavBarItem(
            icon: Icons.search,
            title: 'Search',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AppBottomNavBarExampleTwo(),
                ),
              );
            },
          ),
          AppBottomNavBarItem(icon: Icons.add, title: 'Add'),
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
            title: 'Home',
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
            title: 'Search',
            onTap: () {},
          ),
          AppBottomNavBarItem(icon: Icons.add, title: 'Add'),
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
