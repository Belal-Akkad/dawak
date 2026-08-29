import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:dawak/feature/home/domain/entity/home_entity.dart';
import 'package:dawak/feature/home/domain/repo/get_home_repo.dart';
import 'package:dio/dio.dart';

class GetHomeRepositoryImpl implements GetHomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  GetHomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, HomeEntity>> getHome() async {
    try {
      final home = await remoteDataSource.getHome();

      return Right(home);
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