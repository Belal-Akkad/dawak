import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/home/models/product_model.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: context.cairo(
              size: 18,
              weight: AppTypography.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 12.rs(context)),

          Text(
            product.price,
            style: context.cairo(
              size: 16,
              weight: AppTypography.bold,
              color: AppColors.primary800,
            ),
          ),
          SizedBox(height: 8.rs(context)),

          if (product.requiresPrescription)
            Text(
              'يحتاج إلى وصفة طبية',
              style: context.cairo(
                size: 13,
                weight: AppTypography.medium,
                color: AppColors.warning400,
              ),
            )
          else
            Text(
              'لا يحتاج إلى وصفة طبية',
              style: context.cairo(
                size: 13,
                weight: AppTypography.medium,
                color: AppColors.success400,
              ),
            ),
        ],
      ),
    );
  }
}
