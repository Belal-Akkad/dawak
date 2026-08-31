import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';

abstract class GetOrderDetailsState {
  const GetOrderDetailsState();
}

class GetOrderDetailsInitial extends GetOrderDetailsState {}

class GetOrderDetailsLoading extends GetOrderDetailsState {}

class GetOrderDetailsSuccess extends GetOrderDetailsState {
  final OrderDetailsEntity orderDetails;

  const GetOrderDetailsSuccess(this.orderDetails);
}

class GetOrderDetailsFailure extends GetOrderDetailsState {
  final String message;

  const GetOrderDetailsFailure(this.message);
}