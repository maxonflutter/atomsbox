part of '../simple_preview_screen.dart';

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
              SimpleLabelExample(),
              SimpleSliderExample(),
              SimpleGradientContainerExample(),
              SimpleIconButtonExample(),
              SimpleChipExample(),
              SimpleImageExample(),
              SimpleButtonExample(),
              SimpleTextExample(),
              SimpleTextFormFieldExample(),
            ],
          ),
        ],
      ),
    );
  }
}
