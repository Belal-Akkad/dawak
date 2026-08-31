import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartFooterActions extends StatelessWidget {
  final int differentProductsCount;
  final double totalPrice;
  final VoidCallback onConfirmOrder;
  final VoidCallback onClearCart;

  const CartFooterActions({
    super.key,
    required this.differentProductsCount,
    required this.totalPrice,
    required this.onConfirmOrder,
    required this.onClearCart,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
  left: false,
  right: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.rs(context)),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: onClearCart,
                color: AppColors.primaryBrandWhite,
                borderColor: AppColors.primary500,
                borderRadius: 16.rs(context),
                padding: EdgeInsets.symmetric(vertical: 12.rs(context)),
                child: Text(
                  'تجاهل',
                  textAlign: TextAlign.center,
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.primary500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.rs(context)),
            Expanded(
              child: CustomButton(
                onPressed: onConfirmOrder,
                color: AppColors.primary600,
                borderRadius: 16.rs(context),
                padding: EdgeInsets.symmetric(vertical: 12.rs(context)),
                child: Text(
                  'التالي',
                  textAlign: TextAlign.center,
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.primaryBrandWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
