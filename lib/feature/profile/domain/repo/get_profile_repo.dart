import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';

abstract class GetProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();
}