import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,

      child: Image.asset(
        AppAssets.logoImage,
        width: 150.rs(context),
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
