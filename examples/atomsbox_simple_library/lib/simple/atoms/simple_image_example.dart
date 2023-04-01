import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleImageExample extends StatelessWidget {
  const SimpleImageExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          'This is a SimpleImage',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleImage(
          height: 150,
          imageUrl:
              'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80',
        ),
        SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
