part of '../../main.dart';

class _Atoms extends StatelessWidget {
  const _Atoms();

  @override
  Widget build(BuildContext context) {
    return AppBreakpoints.isMobile(context)
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppTextFormFieldsExample(),
                AppCardsExample(),
                AppButtonsExample(),
                AppTextExample(),
                AppImageExample(),
              ],
            ),
          )
        : Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppButtonsExample(),
                      AppTextExample(),
                      AppImageExample(),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.xlg),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppTextFormFieldsExample(),
                      AppCardsExample(),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}

// class SliderExampleOne extends StatefulWidget {
//   const SliderExampleOne({
//     super.key,
//   });

//   @override
//   State<SliderExampleOne> createState() => _SliderExampleOneState();
// }

// class _SliderExampleOneState extends State<SliderExampleOne> {
//   double sliderValue = 0.5;
//   @override
//   Widget build(BuildContext context) {
//     return AppSlider(
//       value: sliderValue,
//       showMinValue: true,
//       showMaxValue: true,
//       divisions: 5,
//       onChanged: (double value) {
//         setState(() {
//           sliderValue = value;
//         });
//       },
//     );
//   }
// }

// // class SliderExampleTwo extends StatefulWidget {
// //   const SliderExampleTwo({
// //     super.key,
// //   });

// //   @override
// //   State<SliderExampleTwo> createState() => _SliderExampleTwoState();
// // }

// // class _SliderExampleTwoState extends State<SliderExampleTwo> {
// //   double sliderValue = 0.5;
// //   @override
// //   Widget build(BuildContext context) {
// //     return AppSlider(
// //       value: sliderValue,
// //       divisions: 5,
// //       onChanged: (double value) {
// //         setState(() {
// //           sliderValue = value;
// //         });
// //       },
// //     );
// //   }
// // }

//  const SizedBox(height: AppConstants.xlg),
//           AppCard.filled(
//             height: 50,
//             child: const Center(child: Text('This is a filled card')),
//           ),
//           const SizedBox(height: AppConstants.sm),
//           AppCard.elevated(
//             height: 50,
//             child: const Center(child: Text('This is an elevated card')),
//           ),
//           const SizedBox(height: AppConstants.sm),
//           AppCard.outlined(
//             height: 50,
//             child: const Center(child: Text('This is an outlined card')),
//           ),
//           const SizedBox(height: AppConstants.sm),
//           Container(
//             height: 75,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(
//                   'https://images.unsplash.com/photo-1680675313845-13d3f5f17080?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2671&q=80',
//                 ),
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AppCard.glass(
//                   height: 50,
//                   child: const Center(child: Text('This is an glass card')),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: AppConstants.sm),
//           AppCard.gradient(
//             height: 50,
//             child: const Center(child: Text('This is an gradient card')),
//           ),
//           const SizedBox(height: AppConstants.sm),
//  
//           
//           const SizedBox(height: AppConstants.xlg),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: const [
//               AppLabel(
//                 icon: Icons.abc,
//                 text: 'This is a label w/ icon',
//               ),
//               AppLabel(
//                 text: 'This is a label',
//               ),
//             ],
//           ),
//           const SizedBox(height: AppConstants.xlg),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: const [
//               AppLabel(
//                 icon: Icons.abc,
//                 text: 'This is a label w/ icon',
//                 primary: false,
//               ),
//               AppLabel(
//                 text: 'This is a label',
//                 primary: false,
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppText.displayLarge('Display Large'),
//               AppText.displayMedium('Display Medium'),
//               AppText.displaySmall('Display Small'),
//               AppText.headlineLarge('Headline Large'),
//               AppText.headlineMedium('Headline Medium'),
//               AppText.headlineSmall('Headline Small'),
//               AppText.bodyLarge('Body Large'),
//               AppText.bodyMedium('Body Medium'),
//               AppText.bodySmall('Body Small'),
//             ],
//           ),
//           const SizedBox(height: AppConstants.xlg),
//           AppImage.network(
//             'https://images.unsplash.com/photo-1680675313845-13d3f5f17080?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2671&q=80',
//             height: 200,
//             width: double.infinity,
//             blurred: true,
//             child: AppText('This is a blurred image'),
//           ),
//           const SizedBox(height: AppConstants.xlg),
//           const SizedBox(height: AppConstants.xlg),
