import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppDataTableExample extends StatelessWidget {
  const AppDataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppDataTable(
          title: AppText('This is a data table'),
          description: AppText('This is the description'),
          columns: const ['columns 1', 'columns 2', 'columns 3'],
          rows: [
            {
              'columns 1': AppText('row 1'),
              'columns 2': AppText('row 1'),
              'columns 3': AppText('row 1')
            },
            {
              'columns 1': AppText('row 2'),
              'columns 2': AppText('row 2'),
              'columns 3': AppText('row 2')
            },
            {
              'columns 1': AppText('row 3'),
              'columns 2': AppText('row 3'),
              'columns 3': AppText('row 3')
            },
          ],
        ),
      ],
    );
  }
}
