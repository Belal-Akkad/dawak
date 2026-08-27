import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/profile/domain/repo/delete_account_repo.dart';

class DeleteAccountUseCase {
  DeleteAccountUseCase({
    required DeleteAccountRepo repository,
  }) : _repository = repository;

  final DeleteAccountRepo _repository;

  Future<Either<Failure, void>> call() async {
    return await _repository.deleteAccount();
  }
}