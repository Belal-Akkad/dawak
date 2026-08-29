import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/categories/data/remote_data_source/categories_remote_data_source.dart';
import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:dawak/feature/categories/domain/repo/categories_repository.dart';
import 'package:dio/dio.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource remoteDataSource;

  CategoriesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();

      return Right(categories);
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
