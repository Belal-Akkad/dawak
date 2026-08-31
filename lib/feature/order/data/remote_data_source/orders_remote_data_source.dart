import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/order/data/model/order_details_model.dart';
import 'package:dawak/feature/order/data/model/order_model.dart';

class OrdersRemoteDataSource {
  OrdersRemoteDataSource({required DioClient dioClient})
    : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<List<OrderModel>> getOrders() async {
    final response = await _dioClient.dio.get(
      ApiConstants.ordersEndPoint,
    );

    final data = response.data['data'] as List;

    return data
        .map(
          (json) => OrderModel.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<OrderDetailsModel> getOrderDetails(int orderId) async {
    final response = await _dioClient.dio.get(
      ApiConstants.orderDetailsEndPoint(orderId),
    );

    return OrderDetailsModel.fromJson(
      response.data['data'],
    );
  }
}