import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:dawak/feature/categories/presentation/widgets/categories_empty_grid.dart';
import 'package:dawak/feature/categories/presentation/widgets/categories_grid.dart';
import 'package:flutter/material.dart';

class CategoryBody extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoryBody({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const CategoriesEmtpyGrid();
    }

    return CategoriesGrid(
      categories: categories,
    );
  }
}