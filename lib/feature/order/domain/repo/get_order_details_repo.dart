import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';

abstract class GetOrderDetailsRepository {
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails(
    int orderId,
  );
}