import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class CartPriceSection extends StatelessWidget {
  final int unitPrice;
  final int totalPrice;

  const CartPriceSection({
    super.key,
    required this.unitPrice,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'سعر القطعة: $unitPrice ل.س',
          style: context.cairo(
            size: 12,
            weight: AppTypography.bold,
            color: AppColors.neutral800,
          ),
        ),
        SizedBox(height: 4.rs(context)),
        Text(
          'الإجمالي: $totalPrice ل.س',
          style: context.cairo(
            size: 12,
            weight: AppTypography.bold,
            color: AppColors.primary700,
          ),
        ),
      ],
    );
  }
}
