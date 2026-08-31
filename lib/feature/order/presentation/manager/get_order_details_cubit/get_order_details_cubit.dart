import 'package:dawak/feature/order/presentation/manager/get_order_details_cubit/get_order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/feature/order/domain/use_case/get_order_details_use_case.dart';


class GetOrderDetailsCubit extends Cubit<GetOrderDetailsState> {
  GetOrderDetailsCubit(this.getOrderDetailsUseCase)
      : super(GetOrderDetailsInitial());

  final GetOrderDetailsUseCase getOrderDetailsUseCase;

  Future<void> getOrderDetails(int orderId) async {
    emit(GetOrderDetailsLoading());

    final result = await getOrderDetailsUseCase(orderId);

    result.fold(
      (failure) {
        emit(GetOrderDetailsFailure(failure.message));
      },
      (orderDetails) {
        emit(GetOrderDetailsSuccess(orderDetails));
      },
    );
  }
}