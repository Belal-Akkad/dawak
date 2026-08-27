import 'package:dartz/dartz.dart';

import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/auth/domain/repo/register_repo.dart';

class RegisterUseCase {
  RegisterUseCase({required RegisterRepo repository})
    : _repository = repository;

  final RegisterRepo _repository;

  Future<Either<Failure, void>> call({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    return _repository.register(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );
  }
}
