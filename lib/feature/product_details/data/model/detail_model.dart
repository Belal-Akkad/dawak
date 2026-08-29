import 'package:dawak/feature/product_details/domain/entity/detail_entity.dart';

class DetailModel extends DetailEntity {
  const DetailModel({
    required super.id,
    required super.productId,
    required super.type,
    required super.content,
    required super.createdAt,
    required super.updatedAt,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'],
      productId: json['product_id'],
      type: json['type'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}