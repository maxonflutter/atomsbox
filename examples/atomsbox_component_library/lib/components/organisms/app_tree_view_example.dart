import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppTreeViewExample extends StatelessWidget {
  const AppTreeViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ExampleAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.sm),
        child: Column(
          children: [
            AppTreeView(
              iconSize: 24,
              indent: AppConstants.sm,
              nodes: [
                AppTreeNode(
                  icon: Icon(
                    Icons.folder_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  expandedIcon: Icon(
                    Icons.folder_open_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  content: AppText('examples'),
                  children: [
                    AppTreeNode(
                      onPressed: () {
                        print('Pressed on the left node');
                      },
                      icon: Icon(
                        Icons.description,
                        size: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      content: AppText('app_name'),
                    ),
                  ],
                ),
                AppTreeNode(
                  onPressed: () {},
                  icon: Icon(
                    Icons.folder_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  expandedIcon: Icon(
                    Icons.folder_open_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  content: AppText('tools'),
                  children: [
                    AppTreeNode(
                      onPressed: () {
                        print('Pressed on the left node');
                      },
                      icon: Icon(
                        Icons.description,
                        size: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      content: AppText('tool_name'),
                    ),
                  ],
                ),
                AppTreeNode(
                  onPressed: () {},
                  icon: Icon(
                    Icons.folder_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  expandedIcon: Icon(
                    Icons.folder_open_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  content: AppText('packages'),
                  children: [
                    AppTreeNode(
                      icon: Icon(
                        Icons.folder_outlined,
                        size: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      expandedIcon: Icon(
                        Icons.folder_open_outlined,
                        size: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      content: AppText('package_1'),
                      children: [
                        AppTreeNode(
                          onPressed: () {
                            print('Pressed on the left node');
                          },
                          icon: Icon(
                            Icons.description,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          content: AppText('file_1'),
                        ),
                      ],
                    ),
                    AppTreeNode(
                      icon: Icon(
                        Icons.folder_outlined,
                        size: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      expandedIcon: Icon(
                        Icons.folder_open_outlined,
                        size: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      content: AppText('package_2'),
                      children: [
                        AppTreeNode(
                          icon: Icon(
                            Icons.folder_outlined,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          expandedIcon: Icon(
                            Icons.folder_open_outlined,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          content: AppText('lib'),
                          children: [
                            AppTreeNode(
                              onPressed: () {
                                print('Pressed on the left node');
                              },
                              icon: Icon(
                                Icons.description,
                                size: 32,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              content: AppText('main.dart'),
                            ),
                          ],
                        ),
                        AppTreeNode(
                          onPressed: () {
                            print('Pressed on the left node');
                          },
                          icon: Icon(
                            Icons.description,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          content: AppText('CHANGELOG'),
                        ),
                        AppTreeNode(
                          onPressed: () {
                            print('Pressed on the left node');
                          },
                          icon: Icon(
                            Icons.description,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          content: AppText('LICENSE'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
