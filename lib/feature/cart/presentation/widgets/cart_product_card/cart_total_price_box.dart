import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/functions/format_price.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class CartTotalPriceBox extends StatelessWidget {
  final double lastTotalPrice;
  final double totalPrice;

  const CartTotalPriceBox({
    super.key,
    required this.lastTotalPrice,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.rs(context),
      padding: EdgeInsets.symmetric(
        horizontal: 12.rs(context),
        vertical: 20.rs(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(12.rs(context)),
        border: Border.all(color: AppColors.neutral100, width: 1),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'الإجمالي',
              style: context.cairo(
                size: 16,
                weight: AppTypography.bold,
                color: AppColors.primary600,
              ),
            ),
            SizedBox(height: 4.rs(context)),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              tween: Tween<double>(begin: lastTotalPrice, end: totalPrice),
              builder: (context, value, child) {
                final animatedTotal = double.parse(value.toStringAsFixed(1));
                return Text(
                  '${formatPrice(animatedTotal)} ل.س',
                  style: context.cairo(
                    size: 16,
                    weight: AppTypography.bold,
                    color: AppColors.success700,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
