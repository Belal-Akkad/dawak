import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/order/domain/entity/order_entity.dart';

abstract class GetOrdersRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders(
  );
}