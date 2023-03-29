import 'package:flutter/material.dart';

import '../atoms/config/simple_constants.dart';
import '../atoms/simple_image.dart';
import '../atoms/simple_text.dart';

/// A simple audio player widget to display a song's details and
/// the audio controls.
///
/// The [SimpleAudioPlayer] widget displays the song's name, artist's name,
/// cover image, and provides audio controls and a seek bar for the user. It
/// can be displayed in two styles: dense or expanded, based on the [dense]
/// property.
///
/// The [songName], [artistName], [songUrl], [imageUrl], [audioControls], and
/// [audioSeekbar] are required arguments.
///
/// ## Styles
///
/// The [SimpleAudioPlayer] can be displayed in a dense or expanded style,
/// which can be controlled using the [dense] property. By default, it's set
/// to false (expanded style). In the dense style, the widget takes up less
/// space and displays a more compact layout.
///
/// See also:
/// * [SimpleText], a text widget used to display the song and artist names.
/// * [SimpleImage], an image widget used to display the cover image.
///
class SimpleAudioPlayer extends StatelessWidget {
  const SimpleAudioPlayer({
    super.key,
    required this.songName,
    required this.artistName,
    required this.songUrl,
    required this.imageUrl,
    required this.audioControls,
    required this.audioSeekbar,
    this.dense = false,
  });

  /// The name of the song to display.
  final String songName;

  /// The name of the artist to display.
  final String artistName;

  /// The URL of the song file.
  final String songUrl;

  /// The URL of the cover image.
  final String imageUrl;

  /// The widget to control the audio playback (SimpleAudioControls).
  final Widget audioControls;

  /// The widget for the audio seek bar (SimpleAudioSeekbar).
  final Widget audioSeekbar;

  /// Whether the widget should be displayed in dense style.
  ///
  /// If true, the widget takes up less space and displays a more compact layout.
  /// Defaults to false (expanded style).
  final bool dense;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var _image;
    var _artistName;
    var _songName;

    _artistName = SimpleText(
      artistName,
      textStyle: dense ? TextStyleEnum.bodySmall : TextStyleEnum.bodyMedium,
    );

    _songName = SimpleText(
      songName,
      textStyle: dense ? TextStyleEnum.bodyLarge : TextStyleEnum.headlineSmall,
    );

    _image = SimpleImage(
      height: dense ? size.height * 0.05 : size.height * 0.55,
      width: dense ? size.width * 0.1 : size.width,
      imageUrl: imageUrl,
    );

    return dense
        ? _buildSimpleAudioPlayerDense(
            context, size, _image, _artistName, _songName)
        : _buildSimpleAudioPlayerExpanded(_image, _artistName, _songName);
  }

  Column _buildSimpleAudioPlayerExpanded(_image, _artistName, _songName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _image,
        const SizedBox(height: SimpleConstants.md),
        _artistName,
        _songName,
        const SizedBox(height: SimpleConstants.md),
        audioSeekbar,
        const SizedBox(height: SimpleConstants.md),
        audioControls,
      ],
    );
  }

  Container _buildSimpleAudioPlayerDense(
      BuildContext context, Size size, _image, _artistName, _songName) {
    return Container(
      padding: const EdgeInsets.only(
        left: SimpleConstants.sm,
        right: SimpleConstants.sm,
        top: SimpleConstants.sm,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(
          SimpleConstants.borderRadius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _image,
              const SizedBox(width: SimpleConstants.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_songName, _artistName],
                ),
              ),
              const SizedBox(width: SimpleConstants.sm),
              audioControls,
            ],
          ),
          audioSeekbar,
        ],
      ),
    );
  }
}
