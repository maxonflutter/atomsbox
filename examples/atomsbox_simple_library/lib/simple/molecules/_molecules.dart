part of '../simple_preview_screen.dart';

class _Molecules extends StatelessWidget {
  const _Molecules({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> examples = const [
      SimpleFormExample(darkMode: false),
      // SimpleListTileExample(darkMode: false),
      SimpleToggleButtonsExample(darkMode: false),
      SimpleAccordionExample(darkMode: false),
      SimpleCardExample(darkMode: false),
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

class _MoleculesDark extends StatelessWidget {
  const _MoleculesDark({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> examples = const [
      SimpleFormExample(darkMode: true),
      // SimpleListTileExample(darkMode: true),
      SimpleToggleButtonsExample(darkMode: true),
      SimpleAccordionExample(darkMode: true),
      SimpleCardExample(darkMode: true),
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
