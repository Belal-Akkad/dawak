import 'package:dawak/feature/product_details/domain/use_case/get_product_details_use_case.dart';
import 'package:dawak/feature/product_details/presentation/manager/product_details_cubit/prodcut_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.getProductDetailsUseCase)
    : super(ProductDetailsInitial());

  final GetProductDetailsUseCase getProductDetailsUseCase;

  Future<void> getProductDetails(String endpoint) async {
    emit(ProductDetailsLoading());

    final result = await getProductDetailsUseCase(endpoint);

    result.fold(
      (failure) {
        emit(ProductDetailsError(failure.message));
      },
      (productDetails) {
        emit(ProductDetailsSuccess(productDetails));
      },
    );
  }
}
