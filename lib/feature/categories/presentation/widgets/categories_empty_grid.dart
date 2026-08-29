import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:flutter/material.dart';

class CategoriesEmtpyGrid extends StatelessWidget {
  const CategoriesEmtpyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'لا يوجد نتائج',
              textAlign: TextAlign.center,
              style: context.cairo(
                size: 16,

                weight: AppTypography.bold,
                color: AppColors.primary900,
              ),
            ),
            SizedBox(height: 8.rs(context)),
            Text(
              'حاول البحث عن قسم آخر.',
              textAlign: TextAlign.center,
              style: context.cairo(
                weight: AppTypography.semiBold,
                size: 14.rs(context),
                color: AppColors.neutral600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
