import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class OrderSummaryPriceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final Color? iconColor;
  final double iconSize;
  final double valueSize;

  const OrderSummaryPriceItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.iconColor,
    this.iconSize = 24,
    this.valueSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(
          icon,
          size: iconSize.rs(context),
          color: iconColor ?? AppColors.primary950,
        ),

        SizedBox(width: 10.rs(context)),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: context.cairo(
                  size: 14,
                  weight: AppTypography.bold,
                  color: AppColors.primary950,
                ),
              ),

              Text(
                value,
                style: context.cairo(
                  size: valueSize,
                  weight: AppTypography.bold,
                  color: valueColor ?? AppColors.primary950,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
