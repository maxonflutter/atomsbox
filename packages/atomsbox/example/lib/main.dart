import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AtomsboxDemo());

class AtomsboxDemo extends StatelessWidget {
  const AtomsboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple',
      theme: simpleAppTheme(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: SimpleDrawer(
            drawerItems: [
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
                colorPalette: ColorPalette.transparent,
              ),
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
                colorPalette: ColorPalette.transparent,
              ),
              SimpleListTile(
                onTap: () {},
                title: 'This is a drawer item',
                colorPalette: ColorPalette.transparent,
              ),
            ],
            drawerSecondaryItems: [
              SimpleListTile(
                onTap: () {},
                title: 'A secondary drawer item',
                leading: const Icon(Icons.settings),
                colorPalette: ColorPalette.transparent,
              ),
            ],
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const SimpleText(
              'simple',
              textStyle: TextStyleEnum.headlineMedium,
            ),
          ),
          body: SimpleTab(
            tabBarItemNames: const [
              'Atoms',
              'Molecules',
              'Organisms',
            ],
            tabBarItemIcons: const [
              Icons.home,
              Icons.code,
              Icons.people,
            ],
            tabBarViewChildren: const [
              _Atoms(),
              _Molecules(),
              _Organisms(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Atoms extends StatelessWidget {
  const _Atoms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: SimpleConstants.lg),
              SimpleText("More examples at atomsbox.com"),
              SizedBox(height: SimpleConstants.lg),
              SimpleSliderExample(),
              SimpleButtonExample(),
              SimpleTextFormFieldExample(),

              /// More examples at atomsbox.com
            ],
          ),
        ],
      ),
    );
  }
}

class _Molecules extends StatelessWidget {
  const _Molecules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: SimpleConstants.lg),

          SimpleText("More examples at atomsbox.com"),
          SizedBox(height: SimpleConstants.lg),
          SimpleListTileExample(),
          SimpleToggleButtonsExample(),
          SimpleAccordionExample(),

          /// More examples at atomsbox.com
        ],
      ),
    );
  }
}

class _Organisms extends StatelessWidget {
  const _Organisms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: SimpleConstants.lg),
          SimpleText("More examples at atomsbox.com"),
          SizedBox(height: SimpleConstants.lg),
          SimpleGridExample(),
          SimpleListExample(),
          SimpleAudioPlayerExample(),

          /// More examples at atomsbox.com
        ],
      ),
    );
  }
}

class SimpleAccordionExample extends StatelessWidget {
  const SimpleAccordionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SimpleText(
          'These are SimpleAccordion widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          initiallyExpanded: true,
          title: 'Accordion #1',
          children: [
            SimpleText(
              'This is the child of the accordion #1',
              textStyle: TextStyleEnum.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #1',
              textStyle: TextStyleEnum.bodySmall,
            ),
          ],
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          title: 'Accordion #2',
          children: [
            SimpleText(
              'This is the child of the accordion #2',
              textStyle: TextStyleEnum.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #2',
              textStyle: TextStyleEnum.bodySmall,
            )
          ],
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleAccordion(
          title: 'Accordion #3',
          children: [
            SimpleText(
              'This is the child of the accordion #3',
              textStyle: TextStyleEnum.bodySmall,
            ),
            SimpleText(
              'This is another child of the accordion #3',
              textStyle: TextStyleEnum.bodySmall,
            )
          ],
        ),
        SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}

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
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                content: SimpleText(
                  'Tapped on the list tile',
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            );
          },
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      content: SimpleText(
                        'Tapped on the traling icon',
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  );
                },
                icon: Icons.add,
                colorPalette: ColorPalette.primary,
              ),
            ],
          ),
        ),
        const SizedBox(height: SimpleConstants.sm),
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
        const SizedBox(height: SimpleConstants.sm),
        SimpleListTile(
          onTap: () {},
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

class SimpleToggleButtonsExample extends StatelessWidget {
  const SimpleToggleButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SimpleText(
          'These are SimpleToggleButtons',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: true,
          isSelected: [true, true, false],
          children: [
            SimpleText('First'),
            SimpleText('Second'),
            SimpleText('Third'),
          ],
        ),
        SizedBox(height: SimpleConstants.sm),
        SimpleToggleButtons(
          multiSelect: false,
          vertical: true,
          isSelected: [true, false, false],
          children: [
            SimpleText('First'),
            SimpleText('Second'),
            SimpleText('Third'),
          ],
        ),
        SizedBox(height: SimpleConstants.lg),
      ],
    );
  }
}

class SimpleAudioPlayerExample extends StatelessWidget {
  const SimpleAudioPlayerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'This is a SimpleAudioPlayer widget',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleAudioPlayer(
          dense: true,
          url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          name: 'SoundHelix-Song-1',
          description: 'SoundHelix',
          imageUrl:
              'https://images.unsplash.com/photo-1680034200882-698487d46a79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80',
          audioControls: SimpleAudioControls(
            dense: true,
            pause: () {},
            play: () {},
          ),
          audioSeekbar: const SimpleAudioSeekbar(
            duration: Duration(seconds: 100),
            position: Duration(seconds: 10),
          ),
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}

class SimpleGridExample extends StatelessWidget {
  const SimpleGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'This is a SimpleGrid widget',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleGrid(
          gridItems: [
            SimpleCard(
              onTap: () {},
              imageUrl:
                  'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
              title: 'This is a dense card',
              tagline: 'This is a tagline',
            ),
            SimpleCard(
              onTap: () {},
              imageUrl:
                  'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
              title: 'This is a dense card',
              tagline: 'This is a tagline',
            ),
            SimpleCard(
              onTap: () {},
              imageUrl:
                  'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
              title: 'This is a dense card',
              tagline: 'This is a tagline',
            ),
            SimpleCard(
              onTap: () {},
              imageUrl:
                  'https://images.unsplash.com/photo-1679882779946-240701eeb54f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
              title: 'This is a dense card',
              tagline: 'This is a tagline',
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}

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

class SimpleSliderExample extends StatefulWidget {
  const SimpleSliderExample({super.key});

  @override
  State<SimpleSliderExample> createState() => _SimpleSliderExampleState();
}

class _SimpleSliderExampleState extends State<SimpleSliderExample> {
  final _value = [1.0, 5.0, 3.0, 7.0];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleSlider widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[0],
          onChanged: (value) {
            setState(() {
              _value[0] = value;
            });
          },
          thumbShape: SliderComponentShape.noThumb,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[1],
          onChanged: (value) {
            setState(() {
              _value[1] = value;
            });
          },
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[2],
          onChanged: (value) {
            setState(() {
              _value[2] = value;
            });
          },
          thumbShape: SliderComponentShape.noThumb,
          colorPalette: ColorPalette.secondaryContainer,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleSlider(
          value: _value[3],
          onChanged: (value) {
            setState(() {
              _value[3] = value;
            });
          },
          colorPalette: ColorPalette.secondaryContainer,
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}

class SimpleButtonExample extends StatelessWidget {
  const SimpleButtonExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleButton widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            Flexible(
              child: SimpleButton(
                onPressed: () {},
                colorPalette: ColorPalette.primary,
                child: SimpleText(
                  'Button',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton(
                onPressed: () {},
                colorPalette: ColorPalette.secondary,
                child: SimpleText(
                  'Button',
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            Flexible(
              child: SimpleButton.outline(
                onPressed: () {},
                colorPalette: ColorPalette.primary,
                child: const SimpleText('Outline Button'),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton.outline(
                onPressed: () {},
                colorPalette: ColorPalette.secondary,
                child: const SimpleText('Outline Button'),
              ),
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.sm),
        Row(
          children: [
            Flexible(
              child: SimpleButton.text(
                onPressed: () {},
                colorPalette: ColorPalette.primary,
                child: const SimpleText(
                  'Text Button',
                  // Optional parameters to enhance the text button style
                  textGradient: true,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: SimpleConstants.sm),
            Flexible(
              child: SimpleButton.text(
                onPressed: () {},
                colorPalette: ColorPalette.secondary,
                child: const SimpleText(
                  'Text Button',
                  // Optional parameters to enhance the text button style
                  textGradient: true,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}

class SimpleTextFormFieldExample extends StatelessWidget {
  const SimpleTextFormFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'These are SimpleTextFormField widgets',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField(labelText: 'Underline'),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField.outline(
          labelText: 'Outline',
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleTextFormField.filled(
          labelText: 'Filled',
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
