import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
}