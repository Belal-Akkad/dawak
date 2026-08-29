import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/categories/domain/entity/category_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
