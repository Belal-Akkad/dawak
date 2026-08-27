import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/profile/data/remote_data_source/profile_remote_data_source.dart';
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';
import 'package:dawak/feature/profile/domain/repo/update_profile_repo.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  UpdateProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile({
    required String name,
    required String phone,
  }) async {
    try {
      final profile = await remoteDataSource.updateProfile(
        name: name,
        phone: phone,
      );

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
