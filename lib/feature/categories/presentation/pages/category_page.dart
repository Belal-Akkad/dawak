import 'package:dawak/core/widgets/custom_loading_indicator.dart';
import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:dawak/feature/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:dawak/feature/categories/presentation/manager/categories_cubit/categories_state.dart';
import 'package:dawak/feature/categories/presentation/widgets/category_body.dart';
import 'package:dawak/feature/categories/presentation/widgets/category_page_header.dart';
import 'package:dawak/feature/profile/presentation/widgets/custom_fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController searchController = TextEditingController();

  List<CategoryEntity> _categories = [];

  @override
  void initState() {
    super.initState();

    searchController.addListener(_onSearchChanged);

    context.read<CategoriesCubit>().getCategories();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  List<CategoryEntity> _getFilteredCategories() {
    final query = searchController.text.trim();

    if (query.isEmpty) {
      return _categories;
    }

    return _categories
        .where((category) => category.name.contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          CategoryPageHeader(controller: searchController, onChanged: (_) {}),

          Expanded(
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return CustomLoadingIndicator();
                }

                if (state is CategoriesFailure) {
                  return CustomFaileWidget(
                    message: state.message,
                    onPressed: () =>
                        context.read<CategoriesCubit>().getCategories(),
                  );
                }

                if (state is CategoriesSuccess) {
                  _categories = state.categories;

                  final filteredCategories = _getFilteredCategories();

                  return CategoryBody(categories: filteredCategories);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
