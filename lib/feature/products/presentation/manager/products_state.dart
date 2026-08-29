import 'package:dawak/feature/products/domain/entity/product_entity.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;

  const ProductsSuccess({
    required this.products,
  });
}

class ProductsFailure extends ProductsState {
  final String message;

  const ProductsFailure({
    required this.message,
  });
}