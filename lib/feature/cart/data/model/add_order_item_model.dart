import '../../domain/entity/add_order_item_entity.dart';

class AddOrderItemModel extends AddOrderItemEntity {
  const AddOrderItemModel({
    required super.productId,
    required super.quantity,
    required super.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'price': price,
    };
  }
}