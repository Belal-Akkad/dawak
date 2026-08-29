import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:dawak/feature/products/domain/repo/products_repo.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(
    String endpoint,
  ) {
    return repository.getProducts(endpoint);
  }
}