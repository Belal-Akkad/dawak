import 'package:dawak/feature/order/domain/use_case/get_orders_use_case.dart';
import 'package:dawak/feature/order/presentation/manager/get_orders_cubit/get_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrdersCubit extends Cubit<OrdersState> {
  GetOrdersCubit({required this.getOrdersUseCase}) : super(const OrdersInitial());

  final GetOrdersUseCase getOrdersUseCase;

  Future<void> getOrders() async {
    emit(const OrdersLoading());

    final result = await getOrdersUseCase();

    result.fold(
      (failure) {
        emit(OrdersFailure(message: failure.message));
      },
      (orders) {
        emit(OrdersSuccess(orders:orders));
      },
    );
  }
}
