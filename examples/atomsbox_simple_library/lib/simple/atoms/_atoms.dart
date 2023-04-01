part of '../simple_preview_screen.dart';

class _Atoms extends StatelessWidget {
  const _Atoms({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> examples = const [
      SimpleTextExample(darkMode: false),
      SimpleLabelExample(darkMode: false),
      SimpleButtonExample(darkMode: false),
      SimpleChipExample(darkMode: false),
      SimpleIconButtonExample(darkMode: false),
      SimpleTextFormFieldExample(darkMode: false),
      SimpleSliderExample(darkMode: false),
      SimpleImageExample(),
      SimpleGradientContainerExample(),
    ];
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(SimpleConstants.sm),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: examples.length,
      itemBuilder: (context, index) {
        return examples[index];
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: SimpleConstants.sm);
      },
    );
  }
}

class _AtomsDark extends StatelessWidget {
  const _AtomsDark({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> examples = const [
      SimpleTextExample(darkMode: true),
      SimpleLabelExample(darkMode: true),
      SimpleButtonExample(darkMode: true),
      SimpleChipExample(darkMode: true),
      SimpleIconButtonExample(darkMode: true),
      SimpleTextFormFieldExample(darkMode: true),
      SimpleSliderExample(darkMode: true),
    ];
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(SimpleConstants.sm),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: examples.length,
      itemBuilder: (context, index) {
        return examples[index];
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: SimpleConstants.sm);
      },
    );
  }
}
