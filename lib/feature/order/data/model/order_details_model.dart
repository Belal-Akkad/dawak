import 'package:dawak/feature/order/data/model/delivery_model.dart';
import 'package:dawak/feature/order/data/model/order_item_model.dart';
import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  const OrderDetailsModel({
    required super.id,
    required super.status,
    super.address,
    required super.totalPrice,
    required super.deliveryPrice,
    required super.orderItems,
    super.delivery,
    super.rejectionReason,
    super.deliveredAt, required super.createdAt,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      status: json['status'],
      address: json['address'],
      createdAt: DateTime.parse(json['created_at'] as String),
      totalPrice: double.parse(json['total_price'].toString()),
      deliveryPrice: double.parse(json['delivery_price'].toString()),
      orderItems: (json['order_items'] as List)
          .map((item) => OrderItemModel.fromJson(item))
          .toList(),
      delivery: json['delivery'] != null
          ? DeliveryModel.fromJson(json['delivery'])
          : null,
      rejectionReason: json['rejection_reason'],
      deliveredAt: json['delivered_at'] != null
          ? DateTime.parse(json['delivered_at'])
          : null,
    );
  }
}
