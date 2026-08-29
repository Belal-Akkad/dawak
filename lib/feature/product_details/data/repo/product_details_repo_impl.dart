import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/product_details/data/remote_data_source/product_details_remote_data_source.dart';
import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:dawak/feature/product_details/domain/repo/product_details_repo.dart';
import 'package:dio/dio.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource remoteDataSource;

  ProductDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
    String endpoint,
  ) async {
    try {
      final productDetails = await remoteDataSource.getProductDetails(endpoint);

      return Right(productDetails);
    } on DioException catch (e) {
      return Left(handleDioExceptions(e));
    } catch (_) {
      return const Left(
        ServerFailure(
          message: 'حدث خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }
}
