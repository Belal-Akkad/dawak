import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String endpoint,
  );
}