import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OrderConfirmationFooterActions extends StatelessWidget {
  const OrderConfirmationFooterActions({super.key, required this.onConfirm});

  final VoidCallback onConfirm;
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
                onPressed: () => Navigator.of(context).pop(),
                color: AppColors.primaryBrandWhite,
                borderColor: AppColors.primary500,
                borderRadius: 16.rs(context),
                padding: EdgeInsets.symmetric(vertical: 12.rs(context)),
                child: Text(
                  'رجوع',
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
                onPressed: onConfirm,
                color: AppColors.primary600,
                borderRadius: 16.rs(context),
                padding: EdgeInsets.symmetric(vertical: 12.rs(context)),
                child: Text(
                  'تأكيد الطلب',
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
