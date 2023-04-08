import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppListExample extends StatelessWidget {
  const AppListExample({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.sm,
        vertical: AppConstants.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppList.horizontal(
            title: AppText('This is a horizontal list'),
            description: AppText('This is a  list description'),
            listItems: [1, 2, 3]
                .map(
                  (e) => AppDefaultCard(
                    width: 300,
                    margin: const EdgeInsets.only(bottom: AppConstants.sm),
                    headline: AppText('This is a card'),
                    subhead: sampleText,
                    supportingText: sampleText,
                    actions: [
                      AppFilledButton(
                          onPressed: () {}, child: AppText('Action 1')),
                      AppFilledButton(
                          onPressed: () {}, child: AppText('Action 2')),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppConstants.sm),
          AppList.vertical(
            title: AppText('This is a vertical list'),
            description: AppText('This is a list description'),
            listItems: [1, 2, 3]
                .map(
                  (e) => AppDefaultCard(
                    type: AppCardType.elevated,
                    width: 300,
                    headline: AppText('This is a card'),
                    subhead: sampleText,
                    supportingText: sampleText,
                    actions: [
                      AppIconButton.gradient(
                        onPressed: () {},
                        child: Icon(Icons.remove),
                      ),
                      AppIconButton.gradient(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppConstants.sm),
          AppList.horizontal(
            title: AppText('This is a horizontal list'),
            description: AppText('This is a  list description'),
            listItems: [1, 2, 3]
                .map(
                  (e) => AppCard.gradient(
                    child: AppListTile(
                      width: 300,
                      onTap: () {},
                      primary: true,
                      isThreeLine: true,
                      leadingWidth: 96,
                      leading: AppImage.network(imageUrl, height: 96),
                      title: AppText(
                        'This is a list tile',
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      subtitle: AppText(
                        sampleText,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      // trailing: const Icon(Icons.offline_bolt),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
