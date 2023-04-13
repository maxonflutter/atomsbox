import 'package:flutter/material.dart';

import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';
import '../molecules/app_text_block.dart';

/// A data table widget for displaying tabular data.
///
/// The [AppDataTable] widget displays a table with rows and columns, and an
/// optional title and description. The table can be used to display structured
/// data in a tabular format.
///
/// See also:
///
/// * [DataTable], which is used internally to create the data table.
class AppDataTable extends StatelessWidget {
  /// Creates a data table widget.
  ///
  /// The [columns] and [rows] parameters must not be null and should contain
  /// a list of column names and a list of rows, respectively. Each row should
  /// be a map with keys matching the column names.
  ///
  /// The number of keys in each row must be equal to the number of columns.
  AppDataTable({
    super.key,
    this.title,
    this.description,
    required this.columns,
    required this.rows,
  }) : assert(!rows.any((row) => row.keys.length != columns.length));

  /// The optional title for the data table.
  final Widget? title;

  /// The optional description for the data table.
  final Widget? description;

  /// The list of column names for the data table.
  ///
  /// Must not be null.
  final List<String> columns;

  /// The list of rows for the data table.
  ///
  /// Each row should be a map with keys matching the column names.
  /// Must not be null.
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
