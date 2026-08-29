import 'package:dawak/feature/products/domain/entity/product_entity.dart';

abstract class SearchHomeState {}

class SearchHomeInitial extends SearchHomeState {}

class SearchHomeLoading extends SearchHomeState {}

class SearchHomeSuccess extends SearchHomeState {
  final List<ProductEntity> products;

  SearchHomeSuccess(this.products);
}

class SearchHomeEmpty extends SearchHomeState {}

class SearchHomeFailure extends SearchHomeState {
  final String message;

  SearchHomeFailure(this.message);
}