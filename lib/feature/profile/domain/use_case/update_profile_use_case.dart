import 'package:dartz/dartz.dart';

import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';
import 'package:dawak/feature/profile/domain/repo/update_profile_repo.dart';

class UpdateProfileUseCase {
  final UpdateProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call({
    required String name,
    required String phone,
  }) {
    return repository.updateProfile(
      name: name,
      phone: phone,
    );
  }
}