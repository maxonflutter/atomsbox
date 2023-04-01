import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleCardExample extends StatelessWidget {
  const SimpleCardExample({
    super.key,
    this.darkMode = false,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          'These are SimpleCard widgets',
          textStyle: SimpleTextStyle.titleMedium,
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black87,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleCard(
          onTap: () {},
          labelIcon: Icons.people,
          labelText: 'Label here',
          height: 200,
          imageUrl:
              'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
          title: 'This is a dense card',
          tagline: 'This is a tagline',
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleCard(
          onTap: () {
            print('Tapped on the card');
          },
          labelIcon: Icons.people,
          labelText: 'Label here',
          height: 300,
          imageUrl:
              'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
          title: 'This is an expanded card',
          tagline: 'This is a tagline',
          paragraph:
              'This is a paragraph, you can add up to 3 lines of text here',
          dense: false,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        const SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}
