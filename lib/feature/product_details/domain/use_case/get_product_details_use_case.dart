import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:dawak/feature/product_details/domain/repo/product_details_repo.dart';

class GetProductDetailsUseCase {
  final ProductDetailsRepository repository;

  GetProductDetailsUseCase(this.repository);

  Future<Either<Failure, ProductDetailsEntity>> call(
    String endpoint,
  ) async {
    return await repository.getProductDetails(endpoint);
  }
}