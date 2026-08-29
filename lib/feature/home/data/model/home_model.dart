import 'package:dawak/feature/categories/data/model/category_model.dart';
import 'package:dawak/feature/home/domain/entity/home_entity.dart';
import 'package:dawak/feature/products/data/models/product_model.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.categories,
    required super.bestSellers,
    required super.newArrivals,
    required super.prescriptionRequired,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      categories: (json['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),

      bestSellers: (json['best_sellers'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),

      newArrivals: (json['new_arrivals'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),

      prescriptionRequired: (json['prescription_required'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}