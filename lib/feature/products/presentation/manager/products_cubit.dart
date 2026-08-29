import 'package:dawak/feature/products/domain/use_case/get_products_use_case.dart';
import 'package:dawak/feature/products/presentation/manager/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({
    required GetProductsUseCase getProductsUseCase,
  })  : _getProductsUseCase = getProductsUseCase,
        super(ProductsInitial());

  final GetProductsUseCase _getProductsUseCase;

  Future<void> getProducts(String endpoint) async {
    emit(ProductsLoading());

    final result = await _getProductsUseCase(endpoint);

    result.fold(
      (failure) => emit(
        ProductsFailure(message: failure.message),
      ),
      (products) => emit(
        ProductsSuccess(products: products),
      ),
    );
  }
}