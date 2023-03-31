part of '../simple_preview_screen.dart';

class _Atoms extends StatelessWidget {
  const _Atoms({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SimpleButtonExample(darkMode: false),
              SizedBox(height: SimpleConstants.sm),
              SimpleButtonExample(darkMode: true),
              SizedBox(height: SimpleConstants.sm),
              SimpleTextFormFieldExample(darkMode: false),
              SizedBox(height: SimpleConstants.sm),
              SimpleTextFormFieldExample(darkMode: true),
              SizedBox(height: SimpleConstants.sm),
              SimpleChipExample(darkMode: false),
              SizedBox(height: SimpleConstants.sm),
              SimpleChipExample(darkMode: true),
              SizedBox(height: SimpleConstants.sm),
              SimpleIconButtonExample(darkMode: false),
              SizedBox(height: SimpleConstants.sm),
              SimpleIconButtonExample(darkMode: true),
              SizedBox(height: SimpleConstants.sm),
              SimpleTextExample(darkMode: false),
              SizedBox(height: SimpleConstants.sm),
              SimpleTextExample(darkMode: true),
              SizedBox(height: SimpleConstants.sm),
              SimpleLabelExample(darkMode: false),
              SizedBox(height: SimpleConstants.sm),
              SimpleLabelExample(darkMode: true),
              SizedBox(height: SimpleConstants.sm),
              SimpleSliderExample(darkMode: false),
              SizedBox(height: SimpleConstants.sm),
              SimpleSliderExample(darkMode: true),
              SizedBox(height: SimpleConstants.sm),
              SimpleImageExample(),
              SizedBox(height: SimpleConstants.sm),
              SimpleGradientContainerExample(),
              SizedBox(height: SimpleConstants.sm),
            ],
          ),
          const SizedBox(height: SimpleConstants.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [],
          ),
        ],
      ),
    );
  }
}
