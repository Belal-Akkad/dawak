import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/extentions/text_style_extension.dart';
import 'package:dawak/core/manager/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/routes/products_route_arqument.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/core/theme/typo_graphy/app_typo_graphy.dart';
import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategoryGrid extends StatelessWidget {
  final List<CategoryEntity> categories;

  const HomeCategoryGrid({super.key, required this.categories});

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
      child: Center(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4 / 5,
            mainAxisSpacing: 24.rs(context),
            crossAxisSpacing: 24.rs(context),
          ),
          itemBuilder: (context, index) {
            final isMore = index == categories.length;

            return GestureDetector(
              onTap: () {
                if (isMore) {
                  context.read<BottomNavCubit>().select(1);
                } else {
                  Navigator.of(context).pushNamed(
                    AppRoutes.products,
                    arguments: ProductsRouteArguments(
                      title: categories[index].name,
                      endpoint: ApiConstants.productsByCategoryEndPoint(
                        categories[index].id,
                      ),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.rs(context)),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBrandWhite,
                        borderRadius: BorderRadius.circular(12.rs(context)),
                      ),
                      child: Center(
                        child: Text(
                          isMore ? 'أكثر' : categories[index].name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: context.cairo(
                            size: 16,
                            weight: AppTypography.bold,
                            color: AppColors.primary900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
