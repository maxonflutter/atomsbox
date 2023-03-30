import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../atoms/simple_text.dart';

// A simple carousel widget for displaying a list of widgets.
///
/// The [SimpleCarousel] widget displays a list of widgets in a horizontal scrollable
/// carousel. The carousel can automatically play and loop through the items, and
/// optionally enlarge the center item while scrolling.
///
/// The carousel can be customized with the following properties:
/// * [title]: An optional title to be displayed above the carousel.
/// * [autoPlay]: Whether the carousel should automatically play and loop through the items.
/// * [enlargeCenterPage]: Whether to enlarge the center item while scrolling.
/// * [enlargeFactor]: The scale factor by which the center item should be enlarged.
/// * [heightFactor]: The factor to determine the height of the carousel.
/// * [viewportFraction]: The fraction of the viewport that each item should occupy.
///
/// See also:
/// * [CarouselSlider], which is used internally by [SimpleCarousel].
///
class SimpleCarousel extends StatelessWidget {
  const SimpleCarousel({
    super.key,
    required this.carouselItems,
    this.title,
    this.autoPlay = true,
    this.enlargeCenterPage = true,
    this.enlargeFactor = 0.15,
    this.heightFactor = 0.25,
    this.viewportFraction = 0.8,
  });

  /// A list of carousel items to be displayed.
  final List<Widget> carouselItems;

  /// An optional title for the carousel.
  final String? title;

  /// Controls the auto-play behavior of the carousel.
  final bool autoPlay;

  /// Determines whether the center item of the carousel should be enlarged.
  final bool enlargeCenterPage;

  /// The factor by which the center item should be enlarged.
  final double enlargeFactor;

  /// Determines the height of the carousel as a factor of the screen height.
  final double heightFactor;

  /// The fraction of the viewport that each carousel item should occupy.
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title != null)
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SimpleText(
                  title!,
                  textStyle: TextStyleEnum.headlineSmall,
                ),
              )
            : const SizedBox(),
        CarouselSlider(
          options: CarouselOptions(
            height: size.height * heightFactor,
            viewportFraction: viewportFraction,
            enlargeCenterPage: enlargeCenterPage,
            enlargeFactor: enlargeFactor,
            autoPlay: autoPlay,
          ),
          items: carouselItems,
        ),
      ],
    );
  }
}
