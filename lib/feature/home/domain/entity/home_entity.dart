import 'package:dawak/feature/categories/domain/entity/category_entity.dart';
import 'package:dawak/feature/products/domain/entity/product_entity.dart';

class HomeEntity {
  final List<CategoryEntity> categories;
  final List<ProductEntity> bestSellers;
  final List<ProductEntity> newArrivals;
  final List<ProductEntity> prescriptionRequired;

  const HomeEntity({
    required this.categories,
    required this.bestSellers,
    required this.newArrivals,
    required this.prescriptionRequired,
  });
}