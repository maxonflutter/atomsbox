import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../atoms/simple_text.dart';

/// A simple carousel widget for displaying a list of widgets.
///
/// The [SimpleCarousel] widget displays a list of carousel items with an optional
/// title. The carousel auto-plays by default and the center item is enlarged
/// to provide a focus effect. You can customize the carousel behavior and appearance
/// using the provided properties.
///
/// ## Properties
///
/// The carousel items are provided as a list of [Widget]s via the [carouselItems] property.
/// The optional [title] property displays a title above the carousel.
///
/// You can control the carousel's auto-play behavior with the [autoPlay] property.
/// By default, the carousel auto-plays. You can disable auto-play by setting [autoPlay] to false.
///
/// The [enlargeCenterPage] property controls whether the center item of the carousel
/// should be enlarged. The default value is true, which means the center item will
/// be enlarged. You can disable this behavior by setting [enlargeCenterPage] to false.
///
/// The [enlargeFactor], [heightFactor], and [viewportFraction] properties allow you
/// to customize the appearance of the carousel. The [enlargeFactor] determines how
/// much the center item should be enlarged, [heightFactor] determines the height of
/// the carousel, and [viewportFraction] determines the fraction of the viewport
/// that each carousel item should occupy.
///
/// See also:
///
/// * [CarouselSlider], the underlying carousel widget used in [SimpleCarousel].
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
