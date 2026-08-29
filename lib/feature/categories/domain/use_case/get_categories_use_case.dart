import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:dawak/feature/categories/domain/repo/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}
