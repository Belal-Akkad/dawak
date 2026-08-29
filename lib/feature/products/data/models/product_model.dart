import 'package:dawak/feature/products/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.quantity,
    required super.isRequiredPrescription,
    required super.categoryId,
    super.imageUrl,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      quantity: json['quantity'],
      isRequiredPrescription: json['is_required_prescription'],
      categoryId: json['category_id'],
      imageUrl: json['image_url'],
    
    );
  }
}
