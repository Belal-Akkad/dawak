
part of 'add_order_cubit.dart';

abstract class AddOrderState {
  const AddOrderState();
}

class AddOrderInitial extends AddOrderState {
  const AddOrderInitial();
}

class AddOrderLoading extends AddOrderState {
  const AddOrderLoading();
}

class AddOrderSuccess extends AddOrderState {
  const AddOrderSuccess();
}

class AddOrderFailure extends AddOrderState {
  final String message;

  const AddOrderFailure(this.message);
}