// import 'package:flutter/material.dart';

// import '../atoms/config/simple_constants.dart';
// import '../atoms/simple_image.dart';
// import '../atoms/simple_text.dart';
// import '../molecules/simple_audio_controls.dart';
// import '../molecules/simple_audio_seekbar.dart';

// /// A simple audio player widget.
// ///
// /// The [SimpleAudioPlayer] widget provides a customizable audio player interface
// /// that displays information about the audio file being played, such as its name,
// /// description, and artwork. It also includes interactive controls and a seekbar.
// ///
// /// The widget can be displayed in either a dense or expanded layout. The layout
// /// is controlled by the [dense] parameter. When [dense] is set to true, the
// /// widget uses a more compact layout with smaller text and images. When [dense]
// /// is set to false (the default), the widget uses a more spacious layout.
// ///
// /// See also:
// /// * [SimpleAudioControls], a widget containing the audio controls, such as play, pause, and stop.
// /// * [SimpleAudioSeekbar], a widget containing the audio seekbar, which allows the user to navigate
// /// through the audio file.
// ///
// class SimpleAudioPlayer extends StatelessWidget {
//   const SimpleAudioPlayer({
//     super.key,
//     required this.url,
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.audioControls,
//     required this.audioSeekbar,
//     this.dense = false,
//   });

//   /// The URL of the audio file to be played.
//   final String url;

//   /// The name of the audio file.
//   final String name;

//   /// A brief description of the audio file.
//   final String description;

//   /// The URL of the image to be displayed as the audio file's artwork.
//   final String imageUrl;

//   /// The widget containing the audio controls, such as play, pause, and stop.
//   final Widget audioControls;

//   /// The widget containing the audio seekbar, which allows the user to navigate
//   /// through the audio file.
//   final Widget audioSeekbar;

//   /// A flag that determines if the audio player should use a dense layout.
//   ///
//   /// If set to true, the layout will be more compact with smaller text and
//   /// images. If set to false (the default), the layout will be more spacious.
//   final bool dense;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     var _name;
//     var _description;
//     var _image;

//     _name = SimpleText(
//       name,
//       textStyle:
//           dense ? SimpleTextStyle.bodyLarge : SimpleTextStyle.headlineSmall,
//     );

//     _description = SimpleText(
//       description,
//       textStyle: dense ? SimpleTextStyle.bodySmall : SimpleTextStyle.bodyMedium,
//     );

//     _image = SimpleImage(
//       height: dense ? size.height * 0.05 : size.height * 0.55,
//       width: dense ? size.width * 0.1 : size.width,
//       imageUrl: imageUrl,
//     );

//     return dense
//         ? _buildSimpleAudioPlayerDense(
//             context, size, _image, _description, _name)
//         : _buildSimpleAudioPlayerExpanded(_image, _description, _name);
//   }

//   Column _buildSimpleAudioPlayerExpanded(_image, _description, _name) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _image,
//         const SizedBox(height: SimpleConstants.md),
//         _description,
//         _name,
//         const SizedBox(height: SimpleConstants.md),
//         audioSeekbar,
//         const SizedBox(height: SimpleConstants.md),
//         audioControls,
//       ],
//     );
//   }

//   Container _buildSimpleAudioPlayerDense(
//       BuildContext context, Size size, _image, _description, _name) {
//     return Container(
//       padding: const EdgeInsets.only(
//         left: SimpleConstants.sm,
//         right: SimpleConstants.sm,
//         top: SimpleConstants.sm,
//       ),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.secondaryContainer,
//         borderRadius: BorderRadius.circular(
//           SimpleConstants.borderRadius,
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               _image,
//               const SizedBox(width: SimpleConstants.sm),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [_name, _description],
//                 ),
//               ),
//               const SizedBox(width: SimpleConstants.sm),
//               audioControls,
//             ],
//           ),
//           const SizedBox(width: SimpleConstants.sm),
//           audioSeekbar,
//         ],
//       ),
//     );
//   }
// }
