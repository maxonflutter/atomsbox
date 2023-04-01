import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleFormExample extends StatefulWidget {
  const SimpleFormExample({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  State<SimpleFormExample> createState() => _SimpleFormExampleState();
}

class _SimpleFormExampleState extends State<SimpleFormExample> {
  @override
  Widget build(BuildContext context) {
    const formItemNames = ['Name', 'Email', 'Password'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          'These is a SimpleForm widget',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
          color: widget.darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleForm(
          formButton: SimpleButton(
            onPressed: () {},
            child: const SimpleText('Submit'),
          ),
          formItems: [
            SimpleTextFormField(
              // labelText: formItemNames[0],
              onChanged: (value) {},
              brightness: widget.darkMode ? Brightness.dark : Brightness.light,
            ),
            SimpleTextFormField(
              // labelText: formItemNames[1],
              onChanged: (value) {},
              brightness: widget.darkMode ? Brightness.dark : Brightness.light,
            ),
            SimpleTextFormField(
              // labelText: formItemNames[2],
              onChanged: (value) {},
              brightness: widget.darkMode ? Brightness.dark : Brightness.light,
            )
          ],
          formItemNames: formItemNames,
        ),
      ],
    );
  }
}
