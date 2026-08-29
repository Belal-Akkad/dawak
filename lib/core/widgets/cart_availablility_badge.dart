import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class CartAvailabilityBadge extends StatelessWidget {
  final int stock;
  final double? iconSize;
  final double? textSize;
  const CartAvailabilityBadge({
    super.key,
    required this.stock,
    this.iconSize,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: iconSize ?? 4.rs(context),
          height: iconSize ?? 4.rs(context),
          decoration: const BoxDecoration(
            color: AppColors.success700,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6.rs(context)),
        Text(
          'متوفر $stock قطع',
          style: context.cairo(
            size: textSize ?? 10,
            weight: AppTypography.bold,
            color: AppColors.success700,
          ),
        ),
      ],
    );
  }
}
