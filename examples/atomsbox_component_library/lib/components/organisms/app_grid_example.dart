import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppGridExample extends StatelessWidget {
  const AppGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return Scaffold(
      appBar: ExampleAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    const gridItems = [1, 2, 3, 4, 5, 6];
                    const crossAxisCount = 2;
                    const gridItemHeight = 48;
                    const horizontalSpacing =
                        AppConstants.sm * (crossAxisCount + 1);
                    const verticalSpacing =
                        AppConstants.sm * (crossAxisCount + 1);

                    return AppGrid(
                      title: AppText('This is a grid'),
                      description: AppText('This is a description'),
                      crossAxisCount: crossAxisCount,
                      height:
                          gridItemHeight * (gridItems.length / crossAxisCount) +
                              verticalSpacing,
                      childAspectRatio:
                          (constraints.maxWidth - horizontalSpacing) /
                              crossAxisCount /
                              gridItemHeight,
                      gridItems: gridItems
                          .map(
                            (e) => AppListTile(
                              onTap: () {},
                              leadingWidth: 48,
                              leading: AppImage.network(imageUrl, height: 48),
                              title: AppText.bodySmall(
                                'This is a list tile',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                const SizedBox(height: AppConstants.xlg),
                AppGrid(
                  title: AppText('This is a grid'),
                  description: AppText('This is a description'),
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  gridItems: [1, 2, 3, 4]
                      .map(
                        (e) => AppUserCard(
                          type: AppCardType.outlined,
                          onTap: () {},
                          imageUrl: imageUrl,
                          headline: AppText.bodyLarge(
                            'Massimo Del Pezzo',
                            maxLines: 1,
                          ),
                          actions: AppFilledButton(
                            onPressed: () {},
                            child: AppText('Add'),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
