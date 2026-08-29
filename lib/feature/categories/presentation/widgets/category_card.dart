import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBrandWhite,
        borderRadius: BorderRadius.circular(18.rs(context)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.rs(context),
          horizontal: 12.rs(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.cairo(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.primary900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
