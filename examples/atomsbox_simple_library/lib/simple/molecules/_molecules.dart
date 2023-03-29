part of '../simple_preview_screen.dart';

class _Molecules extends StatelessWidget {
  const _Molecules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SimpleFormExample(),
            const SimpleAccordionExample(),
            const SimpleToggleButtonsExample(),
            const SimpleListTileExample(),
            const SimpleCardExample(),
            const SimpleAudioSeekbar(
              position: Duration(seconds: 10),
              duration: Duration(seconds: 100),
            ),
            SimpleAudioControls(
              play: () {},
              pause: () {},
            ),
          ],
        ),
      ),
    );
  }
}
