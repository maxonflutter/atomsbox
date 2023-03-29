import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimateInEffectWrapper renders and animates correctly',
      (WidgetTester tester) async {
    const child = SizedBox(width: 50, height: 50);
    const animateInEffectWrapper = AnimateInEffectWrapper(
      duration: Duration(milliseconds: 500),
      initialDelay: Duration(milliseconds: 0),
      initialOffset: Offset(0, 30),
      keepAlive: false,
      child: child,
    );

    await tester.pumpWidget(
      const MyAnimateInEffectWrapper(
        animateInEffectWrapper: animateInEffectWrapper,
      ),
    );

    final childFinder = find.byType(SizedBox);
    expect(childFinder, findsOneWidget);

    // Initial state
    Offset offsetBeforeAnimation = tester.getTopLeft(childFinder);
    expect(offsetBeforeAnimation.dy, 30);

    // Start the animation
    await tester.pump(const Duration(milliseconds: 500));

    // Check the animation progress
    await tester.pump(const Duration(milliseconds: 250));
    Offset offsetDuringAnimation = tester.getTopLeft(childFinder);
    expect(offsetDuringAnimation.dy, greaterThan(0));
    expect(offsetDuringAnimation.dy, lessThan(30));

    // Complete the animation
    await tester.pump(const Duration(milliseconds: 250));
    Offset offsetAfterAnimation = tester.getTopLeft(childFinder);
    expect(offsetAfterAnimation.dy, 0);
  });
}

class MyAnimateInEffectWrapper extends StatelessWidget {
  const MyAnimateInEffectWrapper({
    super.key,
    required this.animateInEffectWrapper,
  });

  final AnimateInEffectWrapper animateInEffectWrapper;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: animateInEffectWrapper,
      ),
    );
  }
}
