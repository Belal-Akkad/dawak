import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        20,
        (_) => Container(
          width: 8.rs(context),
          height: 1.rs(context),
          color: AppColors.primaryBrandBlack,
        ),
      ),
    );
  }
}
