import 'package:flutter/material.dart';

import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';

class AppDataTable extends StatelessWidget {
  AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
  }) : assert(!rows.any((row) => row.keys.length != columns.length));

  final List<String> columns;
  final List<Map<String, dynamic>> rows;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      child: DataTable(
        headingRowColor: MaterialStateProperty.resolveWith(
          (states) => Theme.of(context).colorScheme.primary,
        ),
        columns: columns
            .map(
              (column) => DataColumn(
                label: Expanded(child: AppText(column, color: Colors.white)),
              ),
            )
            .toList(),
        rows: rows.map(
          (row) {
            return DataRow(
              cells: columns.map((column) => DataCell(row[column])).toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}
