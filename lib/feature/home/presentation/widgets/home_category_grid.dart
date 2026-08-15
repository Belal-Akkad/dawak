import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/department/models/department_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dawak/core/theme/app_colors.dart';

class HomeCategoryGrid extends StatelessWidget {
  final List<DepartmentModel> categories;
  final void Function()? onMore;
  final void Function(DepartmentModel category)? onCategoryTap;

  const HomeCategoryGrid({
    super.key,
    required this.categories,
    this.onMore,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.rs(context)),
      padding: EdgeInsets.symmetric(
        horizontal: 22.rs(context),
        vertical: 24.rs(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(12.rs(context)),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 4 / 5,
          mainAxisSpacing: 24.rs(context),
          crossAxisSpacing: 24.rs(context),
        ),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return GestureDetector(
            onTap: index == categories.length - 1
                ? onMore
                : () => onCategoryTap?.call(cat),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.rs(context),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBrandWhite,
                      borderRadius: BorderRadius.circular(12.rs(context)),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            cat.icon,
                            width: 24.rs(context),
                            colorFilter: ColorFilter.mode(
                              AppColors.primary900,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(height: 16.rs(context)),
                          Text(
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            cat.name,
                            style: context.cairo(
                              size: 12,
                              weight: AppTypography.bold,
                              color: AppColors.primary900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
