import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/cart/domain/entity/add_order_entity.dart';

abstract class AddOrderRepository {
  Future<Either<Failure, void>> addOrder(AddOrderEntity order);
}
