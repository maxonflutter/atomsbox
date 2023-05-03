import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

class AppAudioCardExample extends StatelessWidget {
  const AppAudioCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        'https://images.unsplash.com/photo-1679841350010-64f5b144944f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppAudioCard.dense(
          imageUrl: imageUrl,
          songUrl:
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          songName: 'Song Name',
          artistName: 'Artist Name',
          play: () {},
          pause: () {},
          audioPlayerState: AudioPlayerState.paused,
          position: const Duration(seconds: 10),
          duration: const Duration(seconds: 100),
        ),
        const SizedBox(height: AppConstants.sm),
        SizedBox(
          height: 300,
          child: AppAudioCard(
            imageUrl: imageUrl,
            songUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
            songName: 'Song Name',
            artistName: 'Artist Name',
            play: () {},
            pause: () {},
            audioPlayerState: AudioPlayerState.paused,
            position: const Duration(seconds: 10),
            duration: const Duration(seconds: 100),
          ),
        )
      ],
    );
  }
}
