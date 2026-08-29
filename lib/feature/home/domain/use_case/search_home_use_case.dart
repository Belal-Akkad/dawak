import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:dawak/feature/home/domain/repo/search_home_repo.dart';

class SearchHomeUseCase {
  final SearchHomeRepository repository;

  SearchHomeUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(String query) async {
    return await repository.searchProducts(query);
  }
}