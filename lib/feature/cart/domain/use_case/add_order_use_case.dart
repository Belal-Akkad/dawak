import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/cart/domain/entity/add_order_entity.dart';
import 'package:dawak/feature/cart/domain/repo/add_order_repo.dart';

class AddOrderUseCase {
  final AddOrderRepository repository;

  AddOrderUseCase(this.repository);

  Future<Either<Failure, void>> call(AddOrderEntity order) async {
    return await repository.addOrder(order);
  }
}