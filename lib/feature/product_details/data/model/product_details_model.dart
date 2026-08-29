import 'package:dawak/feature/product_details/data/model/detail_model.dart';
import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:dawak/feature/products/data/models/product_model.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel({required super.product, required super.details});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      product: ProductModel.fromJson(json),
      details: (json['details'] as List<dynamic>? ?? [])
          .map((e) => DetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
