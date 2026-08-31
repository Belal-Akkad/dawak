import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/order/domain/entity/order_entity.dart';
import 'package:dawak/feature/order/domain/repo/get_orders_repo.dart';

class GetOrdersUseCase {
  GetOrdersUseCase(this.repository);

  final GetOrdersRepository repository;

  Future<Either<Failure, List<OrderEntity>>> call() {
    return repository.getOrders();
  }
}
