import 'package:dawak/feature/products/domain/entity/product_entity.dart';

class OrderItemEntity {
  final int id;
  final int quantity;
  final double price;
  final ProductEntity product;

  const OrderItemEntity({
    required this.id,
    required this.quantity,
    required this.price,
    required this.product,
  });
}