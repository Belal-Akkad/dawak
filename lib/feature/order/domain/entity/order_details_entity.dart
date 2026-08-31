import 'package:dawak/feature/order/domain/entity/delivry_entity.dart';
import 'package:dawak/feature/order/domain/entity/order_item_entity.dart';

class OrderDetailsEntity {
  final int id;
  final String status;
  final String? address;
  final double totalPrice;
  final double deliveryPrice;
  final List<OrderItemEntity> orderItems;
  final DeliveryEntity? delivery;
  final String? rejectionReason;
  final DateTime? deliveredAt;
  final DateTime createdAt;
  const OrderDetailsEntity({
    required this.id,
    required this.status,
    this.address,
    required this.totalPrice,
    required this.deliveryPrice,
    required this.orderItems,
   required this.createdAt,
    this.delivery,
    this.rejectionReason,
    this.deliveredAt, 
  });
}