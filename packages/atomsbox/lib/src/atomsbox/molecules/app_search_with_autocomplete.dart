import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_text.dart';
import '../atoms/app_text_form_field.dart';
import '../atoms/config/app_constants.dart';

/// A search widget with autocomplete functionality.
///
/// The [AppSearchWithAutocomplete] widget provides a search bar with an
/// autocomplete feature, allowing users to see suggestions based on
/// their input as they type.
///
/// This widget is a combination of an [AppCard] with a search
/// icon, a text field for user input, and a dropdown list of options.
///
/// See also:
///
/// * [AppCard], which is used to display the search icon.
/// * [AppTextFormField], which is used for the text input field.
/// * [RawAutocomplete], which is the core functionality of the autocomplete feature.
class AppSearchWithAutocomplete extends StatelessWidget {
  /// Creates an [AppSearchWithAutocomplete] widget.
  ///
  /// The [controller] argument is required and must not be null. It is used to
  /// manage the text field's content.
  const AppSearchWithAutocomplete({
    super.key,
    // required this.controller,
  });

  /// The controller for the text field.
  ///
  /// This is required to manage the text field's content and must not be null.
  // final TextEditingController controller;

  /// A list of options that the autocomplete feature will use to generate
  /// suggestions based on the user's input.
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
                    controller: textEditingController,
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
