import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';

abstract class DeleteAccountRepo {
  Future<Either<Failure, void>> deleteAccount();
}