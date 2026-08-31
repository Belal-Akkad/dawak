import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';
import 'package:dawak/feature/order/domain/repo/get_order_details_repo.dart';

class GetOrderDetailsUseCase {
  GetOrderDetailsUseCase(this.repository);

  final GetOrderDetailsRepository repository;

  Future<Either<Failure, OrderDetailsEntity>> call(int orderId) {
    return repository.getOrderDetails(orderId);
  }
}