import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/core/routes/products_route_arqument.dart';
import 'package:dawak/core/theme/app_colors.dart';
import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:dawak/feature/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:dawak/feature/categories/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoriesGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(


   backgroundColor: AppColors.primaryBrandWhite,
      color: AppColors.primary600,
      onRefresh: () {
        return context.read<CategoriesCubit>().getCategories();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(24.rs(context)),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18.rs(context),
              crossAxisSpacing: 18.rs(context),
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
      
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.products,
                    arguments: ProductsRouteArguments(
                      title: category.name,
                      endpoint: ApiConstants.productsByCategoryEndPoint(
                        category.id,
                      ),
                    ),
                  );
                },
                child: CategoryCard(category: category),
              );
            },
          ),
        ),
      ),
    );
  }
}
