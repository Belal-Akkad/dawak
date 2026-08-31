import 'package:dawak/feature/cart/data/model/add_order_item_model.dart';

import '../../domain/entity/add_order_entity.dart';

class AddOrderModel extends AddOrderEntity {
  const AddOrderModel({
    required super.address,
    required super.items,
    super.prescriptionImage,
  });

  factory AddOrderModel.fromEntity(AddOrderEntity entity) {
    return AddOrderModel(
      address: entity.address,
      items: entity.items
          .map(
            (item) => AddOrderItemModel(
              productId: item.productId,
              quantity: item.quantity,
              price: item.price,
            ),
          )
          .toList(),
      prescriptionImage: entity.prescriptionImage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'items': items
          .map((item) => (item as AddOrderItemModel).toJson())
          .toList(),
    };
  }
}