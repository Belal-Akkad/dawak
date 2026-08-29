import 'package:dawak/feature/product_details/domain/entity/detail_entity.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';

class ProductDetailsEntity {
  final ProductEntity product;
  final List<DetailEntity> details;

  const ProductDetailsEntity({
    required this.product,
    required this.details,
  });
}