import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/feature/cart/domain/entity/add_order_entity.dart';
import 'package:dawak/feature/cart/domain/use_case/add_order_use_case.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.addOrderUseCase) : super(const AddOrderInitial());

  final AddOrderUseCase addOrderUseCase;

  Future<void> addOrder(AddOrderEntity order) async {
    emit(const AddOrderLoading());

    final result = await addOrderUseCase(order);

    result.fold(
      (failure) {
        emit(AddOrderFailure(failure.message));
      },
      (_) {
        emit(const AddOrderSuccess());
      },
    );
  }
}
