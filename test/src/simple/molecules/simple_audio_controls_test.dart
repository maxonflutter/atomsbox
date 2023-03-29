import 'package:atomsbox/atomsbox.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SimpleAudioControls renders correctly',
      (WidgetTester tester) async {
    // By default, playbackState.playing is false and
    // playbackState.processingState is AudioProcessingState.idle
    final playbackState = PlaybackState();

    final simpleAudioControls = SimpleAudioControls(
      play: () {},
      pause: () {},
      playbackState: playbackState,
    );

    await tester.pumpWidget(
      MySimpleAudioControls(
        simpleAudioControls: simpleAudioControls,
      ),
    );

    // With the default playbackState, the play button should be visible
    final playButtonFinder = find.byIcon(Icons.play_arrow);
    final skipPreviousButtonFinder = find.byIcon(Icons.skip_previous);
    final skipNextButtonFinder = find.byIcon(Icons.skip_next);

    expect(playButtonFinder, findsOneWidget);
    expect(skipPreviousButtonFinder, findsOneWidget);
    expect(skipNextButtonFinder, findsOneWidget);
  });
}

class MySimpleAudioControls extends StatelessWidget {
  const MySimpleAudioControls({
    super.key,
    required this.simpleAudioControls,
  });

  final SimpleAudioControls simpleAudioControls;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: simpleAudioControls,
        ),
      ),
    );
  }
}
