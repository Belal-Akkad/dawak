import 'package:dawak/core/functions/format_price.dart';
import 'package:dawak/core/widgets/cart_availablility_badge.dart';
import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  final ProductDetailsEntity productDetails;

  const ProductDetailsInfoSection({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.rs(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetails.product.name,
            style: context.cairo(
              size: 18,
              weight: AppTypography.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 12.rs(context)),

          Text(
            '${formatPrice(productDetails.product.price)} ل.س',
            style: context.cairo(
              size: 16,
              weight: AppTypography.bold,
              color: AppColors.primary800,
            ),
          ),
          SizedBox(height: 8.rs(context)),

          if (productDetails.product.isRequiredPrescription)
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

          SizedBox(height: 24.rs(context)),

          CartAvailabilityBadge(stock: productDetails.product.quantity),
        ],
      ),
    );
  }
}
