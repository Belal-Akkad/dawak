import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/profile/data/remote_data_source/profile_remote_data_source.dart';
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';
import 'package:dawak/feature/profile/domain/repo/get_profile_repo.dart';
import 'package:dio/dio.dart';

class GetProfileRepositoryImpl implements GetProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  GetProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final profile = await remoteDataSource.getProfile();

      return Right(profile);
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
