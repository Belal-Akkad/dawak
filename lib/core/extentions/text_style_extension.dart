import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextStyle cairo({
    required double size,
    FontWeight weight = FontWeight.w400,
    double? height,
    Color? color,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: AppTypography.fontFamily,
      fontSize: size.rs(this),
      fontWeight: weight,
      height: height,
      color: color,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }
}
