import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class CartTotalPriceBox extends StatelessWidget {
  final int lastTotalPrice;
  final int totalPrice;

  const CartTotalPriceBox({super.key, 
    required this.lastTotalPrice,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.rs(context)),
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(12.rs(context)),
        border: Border.all(
          color: AppColors.neutral100,
          width: 1,
        ),
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
            SizedBox(height: 2.rs(context)),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              tween: Tween<double>(
                begin: lastTotalPrice.toDouble(),
                end: totalPrice.toDouble(),
              ),
              builder: (context, value, child) {
                final animatedTotal = value.round();
                return Text(
                  '$animatedTotal ل.س',
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
