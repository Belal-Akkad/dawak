import 'package:dawak/core/constants/app_assets.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logoImage,
      width: 250.rs(context),
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );
  }
}
