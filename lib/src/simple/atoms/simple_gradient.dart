import 'package:flutter/material.dart';

import 'simple_constants.dart';

class SimpleGradientContainer extends StatelessWidget {
  const SimpleGradientContainer(
    this.colors,
    this.stops, {
    super.key,
    this.width,
    this.height,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.child,
  });

  const SimpleGradientContainer.horizontal(
    this.colors,
    this.stops, {
    super.key,
    this.width,
    this.height,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.child,
  });

  final List<Color> colors;
  final List<double> stops;
  final double? width;
  final double? height;
  final Alignment begin;
  final Alignment end;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
      stops: stops,
    );
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(
          SimpleConstants.borderRadius,
        ),
      ),
      child: child,
    );
  }
}
