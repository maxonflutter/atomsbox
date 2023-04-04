import 'package:flutter/material.dart';

import 'config/simple_constants.dart';

/// A simple gradient container.
///
/// The [SimpleGradientContainer] widget displays a container with a gradient
/// background. The gradient can be either vertical or horizontal, depending on
/// the constructor used. It can also have a child widget.
///
/// The gradient is defined by the [colors] and [stops] arguments. The [colors]
/// list should contain at least two colors, and the [stops] list should have
/// the same length as the [colors] list, with values between 0.0 and 1.0.
///
/// The [width] and [height] arguments are optional and can be used to set
/// specific dimensions for the container.
///
/// The [begin] and [end] arguments determine the direction of the gradient.
/// By default, it is vertical, starting from [Alignment.topCenter] and ending
/// at [Alignment.bottomCenter]. Using the horizontal constructor, the gradient
/// will be horizontal, starting from [Alignment.centerLeft] and ending at
/// [Alignment.centerRight].
///
/// The [child] argument is optional, and it allows adding a child widget to
/// the container.
///
/// See also:
/// * [LinearGradient], which is used to create the gradient for this container.
/// * [Container], which is used as the base for this widget.
///
class SimpleGradientContainer extends StatelessWidget {
  const SimpleGradientContainer(
    this.colors,
    this.stops, {
    super.key,
    this.width,
    this.height,
    this.borderRadius = SimpleConstants.borderRadius,
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
    this.borderRadius = SimpleConstants.borderRadius,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.child,
  });

  /// The list of colors used to create the gradient.
  final List<Color> colors;

  /// The list of stops used to create the gradient.
  ///
  /// Must have the same length as [colors] and values between 0.0 and 1.0.
  final List<double> stops;

  /// The optional width of the container.
  final double? width;

  /// The optional height of the container.
  final double? height;

  /// The starting point of the gradient.
  ///
  /// Defaults to [Alignment.topCenter] for vertical gradients and
  /// [Alignment.centerLeft] for horizontal gradients.
  final Alignment begin;

  /// The ending point of the gradient.
  ///
  /// Defaults to [Alignment.bottomCenter] for vertical gradients and
  /// [Alignment.centerRight] for horizontal gradients.
  final Alignment end;

  final double borderRadius;

  /// The optional child widget to display inside the container.
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
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
