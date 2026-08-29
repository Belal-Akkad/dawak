import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/home/data/remote_data_source/search_home_remote_data_source.dart';
import 'package:dawak/feature/home/domain/repo/search_home_repo.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';
import 'package:dio/dio.dart';

class SearchHomeRepositoryImpl implements SearchHomeRepository {
  final SearchHomeRemoteDataSource remoteDataSource;

  SearchHomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
    String query,
  ) async {
    try {
      final products = await remoteDataSource.searchProducts(query);

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