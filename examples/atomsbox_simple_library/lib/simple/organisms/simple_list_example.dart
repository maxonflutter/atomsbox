import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleListExample extends StatelessWidget {
  const SimpleListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'This is a SimpleList (vertical)',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleList(
          listItems: [
            SimpleListTile(
              onTap: () {},
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
            SimpleListTile(
              onTap: () {},
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
          ],
        ),
        const SizedBox(height: SimpleConstants.sm),
        const SimpleText(
          'This is a SimpleList (horizontal)',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleList(
          physics: const AlwaysScrollableScrollPhysics(),
          height: 100,
          listItems: [
            SimpleListTile(
              width: 300,
              onTap: () {},
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
                    colorPalette: ColorPalette.secondary,
                  ),
                ],
              ),
              colorPalette: ColorPalette.secondaryContainer,
            ),
            SimpleListTile(
              width: 300,
              onTap: () {},
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
                    colorPalette: ColorPalette.secondary,
                  ),
                ],
              ),
              colorPalette: ColorPalette.secondaryContainer,
            ),
            SimpleListTile(
              width: 300,
              onTap: () {},
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
                    colorPalette: ColorPalette.secondary,
                  ),
                ],
              ),
              colorPalette: ColorPalette.secondaryContainer,
            ),
          ],
          type: SimpleListType.horizontal,
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
