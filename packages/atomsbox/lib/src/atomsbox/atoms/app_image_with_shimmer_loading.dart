import 'package:flutter/material.dart';

import 'app_shimmer_loading.dart';

class AppImageWithShimmerLoading extends StatefulWidget {
  const AppImageWithShimmerLoading({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  State<AppImageWithShimmerLoading> createState() =>
      _AppImageWithShimmerLoadingState();
}

class _AppImageWithShimmerLoadingState
    extends State<AppImageWithShimmerLoading> {
  bool isLoading = true;
  late Widget image;

  @override
  void initState() {
    image = Container(color: Colors.grey);
    _loadImage(widget.imageUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: AppShimmerLoading(
        isLoading: isLoading,
        child: image,
      ),
    );
  }

  void _loadImage(String imageName) async {
    Image downloadImage = Image.network(
      imageName,
      fit: widget.fit,
      height: widget.height,
      width: widget.width,
    );

    downloadImage.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, call) {
          setState(() {
            image = downloadImage;
            isLoading = false;
          });
        },
      ),
    );
  }
}
