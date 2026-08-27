import 'package:dartz/dartz.dart';

import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/auth/domain/repo/login_repo.dart';

class LoginUseCase {
  LoginUseCase({
    required LoginRepo repository,
  }) : _repository = repository;

  final LoginRepo _repository;

  Future<Either<Failure, void>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(
      email: email,
      password: password,
    );
  }
}