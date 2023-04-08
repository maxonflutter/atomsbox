import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppListTileExamples extends StatelessWidget {
  const AppListTileExamples({super.key});

  @override
  Widget build(BuildContext context) {
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
          AppListTile(
            onTap: () {},
            leading: const CircleAvatar(radius: 24),
            title: AppText('This is a list tile'),
            subtitle: AppText(sampleText),
            trailing: const Icon(Icons.offline_bolt),
          ),
          const SizedBox(height: AppConstants.sm),
          AppListTile(
            onTap: () {},
            isThreeLine: true,
            leading: AppImage.network(imageUrl, height: 48),
            title: AppText('This is a list tile'),
            // subtitle: AppText(sampleText),
            trailing: Row(
              children: [
                AppIconButton(
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: AppConstants.sm),
                AppIconButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.sm),
          AppListTile(
            onTap: () {},
            primary: true,
            isThreeLine: true,
            leadingWidth: 96,
            leading: AppImage.network(imageUrl, height: 96),
            title: AppText('This is a list tile'),
            subtitle: AppText(sampleText),
            // trailing: const Icon(Icons.offline_bolt),
          ),
          const SizedBox(height: AppConstants.sm),
          AppCard.gradient(
            child: AppListTile(
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
        ],
      ),
    );
  }
}
