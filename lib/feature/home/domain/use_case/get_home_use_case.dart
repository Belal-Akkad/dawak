import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/home/domain/entity/home_entity.dart';
import 'package:dawak/feature/home/domain/repo/get_home_repo.dart';

class GetHomeUseCase {
  final GetHomeRepository repository;

  GetHomeUseCase(this.repository);

  Future<Either<Failure, HomeEntity>> call() {
    return repository.getHome();
  }
}