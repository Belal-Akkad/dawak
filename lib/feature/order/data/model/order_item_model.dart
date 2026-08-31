import 'package:dawak/feature/order/domain/entity/order_item_entity.dart';
import 'package:dawak/feature/products/data/models/product_model.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.id,
    required super.quantity,
    required super.price,
    required super.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      quantity: json['quantity'],
      price: double.parse(json['price'].toString()),
      product: ProductModel.fromJson(json['product']),
    );
  }
}