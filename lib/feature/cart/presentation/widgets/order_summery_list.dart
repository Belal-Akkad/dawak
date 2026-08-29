import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/manager/cart_cubit/cart_cubit.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class OrderSummaryList extends StatelessWidget {
  final CartState cartState;

  const OrderSummaryList({super.key, required this.cartState});

  @override
  Widget build(BuildContext context) {
    final medicinesSubtotal = cartState.totalPrice;
    const deliveryFee = 100;
    final grandTotal = medicinesSubtotal + deliveryFee;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.rs(context)),
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(18.rs(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final product in cartState.items) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.neutral600,
                  ),
                ),
                // Text(
                //   '${cartState.quantityFor(product.id)} × ${product.unitPrice} = ${cartState.productTotal(product)} ل.س',
                //   style: context.cairo(
                //     size: 14,
                //     weight: AppTypography.medium,
                //     color: AppColors.neutral600,
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 8.rs(context)),
          ],
          Divider(color: AppColors.neutral200),
          SizedBox(height: 8.rs(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'إجمالي المنتجات',
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.neutral600,
                ),
              ),
              Text(
                '$medicinesSubtotal ل.س',
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.neutral600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.rs(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'سعر التوصيل',
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.neutral600,
                ),
              ),
              Text(
                '$deliveryFee ل.س',
                style: context.cairo(
                  size: 16,
                  weight: AppTypography.bold,
                  color: AppColors.neutral600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.rs(context)),
          Divider(color: AppColors.neutral200),

          SizedBox(height: 8.rs(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'السعر الإجمالي',
                style: context.cairo(
                  size: 20,
                  weight: AppTypography.bold,
                  color: AppColors.primary900,
                ),
              ),
              Text(
                '$grandTotal ل.س',
                style: context.cairo(
                  size: 20,
                  weight: AppTypography.bold,
                  color: AppColors.primary900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
