import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductsEmptyState extends StatelessWidget {
  const ProductsEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'لا توجد منتجات مطابقة',
        style: context.cairo(
          size: 16,
          weight: FontWeight.w700,
          color: AppColors.primary900,
        ),
      ),
    );
  }
}
