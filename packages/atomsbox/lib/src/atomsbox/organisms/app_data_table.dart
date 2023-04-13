import 'package:flutter/material.dart';

import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import '../molecules/app_text_block.dart';

class AppDataTable extends StatelessWidget {
  AppDataTable({
    super.key,
    this.title,
    this.description,
    required this.columns,
    required this.rows,
  }) : assert(!rows.any((row) => row.keys.length != columns.length));

  final Widget? title;
  final Widget? description;
  final List<String> columns;
  final List<Map<String, dynamic>> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBlock(title: title, subtitle: description),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          child: DataTable(
            headingRowColor: MaterialStateProperty.resolveWith(
              (states) => Theme.of(context).colorScheme.primary,
            ),
            columns: columns
                .map(
                  (column) => DataColumn(
                    label: Expanded(
                      child: AppText(
                        column,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                )
                .toList(),
            rows: rows.map(
              (row) {
                return DataRow(
                  cells:
                      columns.map((column) => DataCell(row[column])).toList(),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
