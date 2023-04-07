import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';
import '../atoms/app_text.dart';

// A simple carousel widget for displaying a list of widgets.
class SimpleCarousel extends StatelessWidget {
  const SimpleCarousel({
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

  final Widget? title;
  final Widget? description;
  final List<Widget> carouselItems;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final double enlargeFactor;
  final double heightFactor;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headlineSmall;
    final descriptionStyle = textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(title != null)
            ? [
                DefaultTextStyle(
                  style: titleStyle!,
                  child: title!,
                ),
                const SizedBox(height: AppConstants.sm),
              ]
            : [const SizedBox()],
        ...(description != null)
            ? [
                DefaultTextStyle(
                  style: descriptionStyle!,
                  child: description!,
                ),
                const SizedBox(height: AppConstants.sm),
              ]
            : [const SizedBox()],
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
