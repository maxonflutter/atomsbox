import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../molecules/app_text_block.dart';

// A carousel widget for displaying a collection of items.
///
/// The [AppCarousel] widget displays a horizontal carousel of items, with
/// optional title and description. The carousel can be customized with various
/// settings, such as auto-play, center page enlargement, and viewport fraction.
///
/// See also:
///
/// * [CarouselSlider], which is used internally to create the carousel.
class AppCarousel extends StatelessWidget {
  /// Creates a carousel widget.
  ///
  /// The [carouselItems] parameter must not be null and should contain a list
  /// of widgets to be displayed in the carousel.
  ///
  /// The [autoPlay], [enlargeCenterPage], [enlargeFactor], [heightFactor], and
  /// [viewportFraction] arguments are optional and have default values.
  const AppCarousel({
    super.key,
    this.title,
    this.description,
    required this.carouselItems,
    this.autoPlay = true,
    this.enlargeCenterPage = true,
    this.enlargeFactor = 0.15,
    this.heightFactor = 0.25,
    this.viewportFraction = 0.8,
  });

  /// The optional title for the carousel.
  final Widget? title;

  /// The optional description for the carousel.
  final Widget? description;

  /// The list of items to be displayed in the carousel.
  ///
  /// Must not be null.
  final List<Widget> carouselItems;

  /// Determines if the carousel should auto-play.
  ///
  /// Defaults to true.
  final bool autoPlay;

  /// Determines if the center page should be enlarged.
  ///
  /// Defaults to true.
  final bool enlargeCenterPage;

  /// The factor by which the center page should be enlarged.
  ///
  /// Defaults to 0.15.
  final double enlargeFactor;

  /// The factor by which the carousel height should be calculated.
  ///
  /// Defaults to 0.25.
  final double heightFactor;

  /// The fraction of the viewport that each carousel item should cover.
  ///
  /// Defaults to 0.8.
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBlock(title: title, subtitle: description),
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
