import 'package:dawak/feature/home/models/product_model.dart';

class ProductsModel {
  final String categoryName;
  final List<ProductModel> products;

  ProductsModel({
    required this.categoryName,
    required this.products,
  });
}