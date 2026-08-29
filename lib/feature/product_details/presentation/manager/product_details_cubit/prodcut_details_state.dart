import 'package:dawak/feature/product_details/domain/entity/product_details_entity.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsEntity productDetails;

  ProductDetailsSuccess(this.productDetails);
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError(this.message);
}