import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleListTileExample extends StatelessWidget {
  const SimpleListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleListTile widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleListTile(
          leading: const SimpleImage(
            height: 100,
            width: 100,
            imageUrl:
                'https://images.unsplash.com/photo-1679854493493-0ae0d2cb2800?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
          ),
          title: 'This is a title',
          subtitle: 'This is a subtitle',
          tagline: 'This is a tagline',
          trailing: Row(
            children: [
              SimpleIconButton(
                onPressed: () {},
                icon: Icons.add,
                colorPalette: ColorPalette.primary,
              ),
            ],
          ),
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleListTile(
          leading: const SimpleImage(
            height: 100,
            width: 100,
            imageUrl:
                'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80',
          ),
          title: 'This is a title',
          subtitle: 'This is a subtitle',
          tagline: 'This is a tagline',
          trailing: Row(
            children: [
              SimpleIconButton(
                onPressed: () {},
                icon: Icons.add,
                colorPalette: ColorPalette.primary,
              ),
            ],
          ),
          colorPalette: ColorPalette.primaryContainer,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleListTile(
          leading: const SimpleImage(
            height: 100,
            width: 100,
            imageUrl:
                'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
          ),
          title: 'This is a title',
          subtitle: 'This is a subtitle',
          tagline: 'This is a tagline',
          trailing: Row(
            children: [
              SimpleIconButton(
                onPressed: () {},
                icon: Icons.add,
                colorPalette: ColorPalette.secondary,
              ),
            ],
          ),
          colorPalette: ColorPalette.secondaryContainer,
        ),
        const SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}
