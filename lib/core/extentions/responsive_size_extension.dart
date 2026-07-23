import 'package:flutter/material.dart';

extension ResponsiveSizeExtension on num {
  double rs(BuildContext context) {
    const double designWidth = 375.0;
    final double screenWidth = MediaQuery.of(context).size.width;

    final double scaleFactor = screenWidth / designWidth;

    return toDouble() * scaleFactor;
  }
}