import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';
import 'package:dawak/feature/profile/domain/repo/get_profile_repo.dart';

class GetProfileUseCase {
  final GetProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call() {
    return repository.getProfile();
  }
}