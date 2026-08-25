import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';


class CartProductInfo extends StatelessWidget {
  final String productName;
  final String productDescription;
  final int unitPrice;
  final String prescriptionText;
  final bool requiresPrescription;

  const CartProductInfo({super.key, 
    required this.productName,
    required this.productDescription,
    required this.unitPrice,
    required this.prescriptionText,
    required this.requiresPrescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.cairo(
            size: 16,
            weight: AppTypography.bold,
            color: AppColors.neutral950,
          ),
        ),
        SizedBox(height: 2.rs(context)),
        Text(
          productDescription,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.cairo(
            size: 12,
            weight: AppTypography.regular,
            color: AppColors.neutral600,
          ),
        ),
        SizedBox(height: 4.rs(context)),
        Text(
          '$unitPrice ل.س',
          style: context.cairo(
            size: 12,
            weight: AppTypography.bold,
            color: AppColors.neutral900,
          ),
        ),
        SizedBox(height: 4.rs(context)),
        Text(
          prescriptionText,
          style: context.cairo(
            size: 12,
            weight: AppTypography.bold,
            color: requiresPrescription
                ? AppColors.warning400
                : AppColors.success400,
          ),
        ),
      ],
    );
  }
}