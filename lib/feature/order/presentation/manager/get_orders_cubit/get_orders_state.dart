
import 'package:dawak/feature/order/domain/entity/order_entity.dart';

abstract class OrdersState {
  const OrdersState();
}

class OrdersInitial extends OrdersState {
  const OrdersInitial();
}

class OrdersLoading extends OrdersState {
  const OrdersLoading();
}

class OrdersSuccess extends OrdersState {
  const OrdersSuccess({
    required this.orders,
  });

  final List<OrderEntity> orders;
}

class OrdersFailure extends OrdersState {
  const OrdersFailure({
    required this.message,
  });

  final String message;
}