
class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final bool isRequiredPrescription;
  final int categoryId;
  final String? imageUrl;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.isRequiredPrescription,
    required this.categoryId,
    this.imageUrl,

  });
}