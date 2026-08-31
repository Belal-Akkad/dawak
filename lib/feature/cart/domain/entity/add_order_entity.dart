import 'dart:io';

import 'package:dawak/feature/cart/domain/entity/add_order_item_entity.dart';

class AddOrderEntity {
  final String address;
  final List<AddOrderItemEntity> items;
  final File? prescriptionImage;

  const AddOrderEntity({
    required this.address,
    required this.items,
    this.prescriptionImage,
  });
}
