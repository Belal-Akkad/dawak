import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';

abstract class RegisterRepo {
  Future<Either<Failure, void>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  });
}