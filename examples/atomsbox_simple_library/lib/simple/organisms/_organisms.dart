part of '../simple_preview_screen.dart';

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
          SimpleDrawerExample(),
          SimpleGridExample(),
          // SimpleListExample(),
          SimpleCarouselExample(),
          SimpleAudioPlayerExample(),
          // SimpleBottomNavBarExample(),
        ],
      ),
    );
  }
}
