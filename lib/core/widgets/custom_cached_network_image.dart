import 'package:cached_network_image/cached_network_image.dart';
import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          const CustomLoadingIndicator(),
      errorWidget: (context, url, error) =>
          errorWidget ??
          const Center(
            child: Icon(Icons.broken_image_outlined),
          ),
    );
  }
}