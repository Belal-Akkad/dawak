import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/home/domain/entity/home_entity.dart';

abstract class GetHomeRepository {
  Future<Either<Failure, HomeEntity>> getHome();
}