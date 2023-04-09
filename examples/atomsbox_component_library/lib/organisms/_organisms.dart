// part of '../../main.dart';

// class _Organisms extends StatelessWidget {
//   const _Organisms();

//   @override
//   Widget build(BuildContext context) {
//     return AppBreakpoints.isMobile(context)
//         ? SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 AppFormExample(),
//                 AppListExample(),
//                 AppGridExample()
//               ],
//             ),
//           )
//         : Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [AppGridExample()],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: AppConstants.xlg),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       AppFormExample(),
//                       AppListExample(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//   }
// }
