import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/products/data/remote_data_source/products_remote_data_source.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:dawak/feature/products/domain/repo/products_repo.dart';
import 'package:dio/dio.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String endpoint,
  ) async {
    try {
      final products = await remoteDataSource.getProducts(endpoint);

      return Right(products);
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