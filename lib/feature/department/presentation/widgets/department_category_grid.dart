import 'package:dawak/core/extentions/responsive_size_extension.dart';
import 'package:dawak/core/routes/app_routes.dart';
import 'package:dawak/feature/department/data/dummy_data.dart';
import 'package:dawak/feature/department/models/department_model.dart';
import 'package:dawak/feature/department/presentation/widgets/department_category_card.dart';
import 'package:dawak/feature/products/data/models/products_model.dart';
import 'package:flutter/material.dart';


class DepartmentCategoryGrid extends StatelessWidget {
  final List<DepartmentModel> categories;

  const DepartmentCategoryGrid({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  Navigator.pushNamed(
                    context,
                    AppRoutes.categoryProducts,
                    arguments: ProductsModel(
                      categoryName: category.name,
                      products: getProductsForCategory(category.name),
                    ),
                  );
                },
                child: DepartmentCategoryCard(
                  icon: category.icon,
                  name: category.name,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
