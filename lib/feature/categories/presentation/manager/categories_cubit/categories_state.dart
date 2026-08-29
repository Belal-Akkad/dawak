import 'package:dawak/feature/categories/domain/entity/category_entity.dart';

abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> categories;

  const CategoriesSuccess({required this.categories});
}

class CategoriesFailure extends CategoriesState {
  final String message;

  const CategoriesFailure({required this.message});
}
