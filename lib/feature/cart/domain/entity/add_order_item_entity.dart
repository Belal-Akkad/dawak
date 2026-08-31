
class AddOrderItemEntity {
  final int productId;
  final int quantity;
  final double price;

  const AddOrderItemEntity({
    required this.productId,
    required this.quantity,
    required this.price,
  });
}