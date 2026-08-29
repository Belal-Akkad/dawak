import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
    String endpoint,
  );
}