import 'package:dawak/feature/department/models/department_model.dart';
import 'package:dawak/feature/department/presentation/widgets/department_category_grid.dart';
import 'package:dawak/feature/department/presentation/widgets/department_empty_grid.dart';
import 'package:flutter/material.dart';

class DepartmentBody extends StatelessWidget {
  final List<DepartmentModel> categories;

  const DepartmentBody({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return categories.isEmpty
        ? const DepartmentEmtpyGrid()
        : DepartmentCategoryGrid(
            categories: categories,
          );
  }
}
