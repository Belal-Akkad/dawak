import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';




class CartAvailabilityBadge extends StatelessWidget {
  final int stock;

  const CartAvailabilityBadge({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 8.rs(context),
          height: 8.rs(context),
          decoration: const BoxDecoration(
            color: AppColors.success700,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6.rs(context)),
        Text(
          'متوفر $stock قطع',
          style: context.cairo(
            size: 14,
            weight: AppTypography.bold,
            color: AppColors.success700,
          ),
        ),
      ],
    );
  }
}