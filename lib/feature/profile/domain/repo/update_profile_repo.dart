import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';

abstract class UpdateProfileRepository {
  Future<Either<Failure, ProfileEntity>> updateProfile({
    required String name,
    required String phone,
  });
}