import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_text.dart';
import '../atoms/app_text_form_field.dart';
import '../atoms/config/app_constants.dart';

class AppSearchWithAutocomplete extends StatelessWidget {
  const AppSearchWithAutocomplete({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  static const List<String> _options = <String>[
    'one',
    'two',
    'three',
    'four',
    'five',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        return Row(
          children: [
            AppCard.gradient(
              height: 48,
              width: 48,
              child: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(width: AppConstants.sm),
            Expanded(
              child: RawAutocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return _options.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted,
                ) {
                  return AppTextFormField.filled(
                    controller: controller,
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                  );
                },
                optionsViewBuilder: (
                  BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options,
                ) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        width: width - 48 - AppConstants.sm * 2,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(AppConstants.sm),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () => onSelected(option),
                              child: ListTile(title: AppText(option)),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
