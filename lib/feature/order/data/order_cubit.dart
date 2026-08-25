import 'package:bloc/bloc.dart';

enum OrderStatus {
  completed,
  rejected,
  delivering,
  pendingReview,
}

extension OrderStatusX on OrderStatus {
  String get arabicLabel {
    switch (this) {
      case OrderStatus.completed:
        return 'مكتملة';
      case OrderStatus.rejected:
        return 'مرفوضة';
      case OrderStatus.delivering:
        return 'قيد التوصيل';
      case OrderStatus.pendingReview:
        return 'قيد المراجعة';
    }
  }
}

class OrderMedicine {
  final String name;
  final int quantity;
  final double price;

  const OrderMedicine({
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class OrderModel {
  final String id;
  final String orderNumber;
  final String orderDate;
  final OrderStatus status;
  final String? completionDate;
  final List<OrderMedicine> products;
  final double productTotal;
  final double deliveryFee;
  final double finalTotal;

  const OrderModel({
    required this.id,
    required this.orderNumber,
    required this.orderDate,
    required this.status,
    this.completionDate,
    this.products = const [],
    this.productTotal = 0,
    this.deliveryFee = 0,
    this.finalTotal = 0,
  });
}

class OrderCubit extends Cubit<List<OrderModel>> {
  OrderCubit() : super(const []);

  void addOrder(OrderModel order) {
    emit([...state, order]);
  }
}
