import 'package:atomsbox/atomsbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MySimpleSlider has a SimpleSlider', (WidgetTester tester) async {
    final simpleSlider = SimpleSlider(
      value: 5.0,
      onChanged: (value) {},
    );

    await tester.pumpWidget(MySimpleSlider(simpleSlider: simpleSlider));

    expect(find.byType(SimpleSlider), findsOneWidget);
  });

  testWidgets('MySimpleSlider has the correct initial value',
      (WidgetTester tester) async {
    final simpleSlider = SimpleSlider(
      value: 5.0,
      onChanged: (value) {},
    );

    await tester.pumpWidget(MySimpleSlider(simpleSlider: simpleSlider));

    final sliderFinder = find.byType(Slider);
    final slider = tester.widget<Slider>(sliderFinder);

    expect(slider.value, 5.0);
  });

  testWidgets('MySimpleSlider onChanged callback is called',
      (WidgetTester tester) async {
    bool onChangedCalled = false;

    final simpleSlider = SimpleSlider(
      value: 5.0,
      onChanged: (value) {
        onChangedCalled = true;
      },
    );

    await tester.pumpWidget(MySimpleSlider(simpleSlider: simpleSlider));

    final sliderFinder = find.byType(Slider);
    await tester.drag(sliderFinder, const Offset(10, 0));

    expect(onChangedCalled, true);
  });

  testWidgets('MySimpleSlider onChangeEnd callback is called',
      (WidgetTester tester) async {
    bool onChangeEndCalled = false;

    final simpleSlider = SimpleSlider(
      value: 5.0,
      onChanged: (value) {},
      onChangeEnd: (value) {
        onChangeEndCalled = true;
      },
    );

    await tester.pumpWidget(MySimpleSlider(simpleSlider: simpleSlider));

    final sliderFinder = find.byType(Slider);
    await tester.drag(sliderFinder, const Offset(10, 0));

    expect(onChangeEndCalled, true);
  });
}

class MySimpleSlider extends StatelessWidget {
  final SimpleSlider simpleSlider;

  const MySimpleSlider({
    super.key,
    required this.simpleSlider,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: simpleSlider,
        ),
      ),
    );
  }
}
