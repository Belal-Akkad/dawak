import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key, this.width = 150});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,

      child: Image.asset(
        AppAssets.logoImage,
        width: width.rs(context),
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
