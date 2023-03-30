part of '../simple_preview_screen.dart';

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
          SimpleListTileExample(),
          SimpleToggleButtonsExample(),
          SimpleAccordionExample(),
          SimpleFormExample(),
          SimpleCardExample(),
          SimpleAudioSeekbarExample(),
          SimpleAudioControlsExample(),
        ],
      ),
    );
  }
}
