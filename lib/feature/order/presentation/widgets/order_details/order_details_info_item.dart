
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class OrderDetailsInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const OrderDetailsInfoItem({super.key, 
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          icon,
          size: 20.rs(context),
          color: AppColors.primary700,
        ),
        SizedBox(width: 10.rs(context)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: context.cairo(
                  size: 13,
                  weight: AppTypography.semiBold,
                  color: AppColors.neutral700,
                ),
              ),
              Text(
                value,
                style: context.cairo(
                  size: 13,
                  weight: AppTypography.bold,
                  color: AppColors.primary800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
