import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class SimpleAudioPlayerExample extends StatelessWidget {
  const SimpleAudioPlayerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SimpleText(
          'This is a SimpleAudioPlayer widget',
          textStyle: TextStyleEnum.titleMedium,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: SimpleConstants.sm),
        SimpleAudioPlayer(
          dense: true,
          url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          name: 'SoundHelix-Song-1',
          description: 'SoundHelix',
          imageUrl:
              'https://images.unsplash.com/photo-1680034200882-698487d46a79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80',
          audioControls: SimpleAudioControls(
            dense: true,
            pause: () {},
            play: () {},
          ),
          audioSeekbar: const SimpleAudioSeekbar(
            duration: Duration(seconds: 100),
            position: Duration(seconds: 10),
          ),
        ),
        const SizedBox(height: SimpleConstants.xlg),
      ],
    );
  }
}
