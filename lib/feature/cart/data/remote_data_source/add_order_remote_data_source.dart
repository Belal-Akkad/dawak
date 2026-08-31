import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/cart/data/model/add_order_model.dart';
import 'package:dio/dio.dart';

class AddOrdersRemoteDataSource {
  AddOrdersRemoteDataSource({required DioClient dioClient})
    : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<void> addOrder(AddOrderModel addOrderModel) async {
    if (addOrderModel.prescriptionImage == null) {
      await _dioClient.dio.post(
        
        ApiConstants.addOrderEndPoint,
        data: addOrderModel.toJson(),
      );

      return;
    }

    final formData = FormData();

    formData.fields.add(MapEntry('address', addOrderModel.address));

    for (int i = 0; i < addOrderModel.items.length; i++) {
      final item = addOrderModel.items[i];

      formData.fields.addAll([
        MapEntry('items[$i][product_id]', item.productId.toString()),
        MapEntry('items[$i][quantity]', item.quantity.toString()),
        MapEntry('items[$i][price]', item.price.toString()),
      ]);
    }

    formData.files.add(
      MapEntry(
        'prescription_image',
        await MultipartFile.fromFile(addOrderModel.prescriptionImage!.path),
      ),
    );

    await _dioClient.dio.post(ApiConstants.addOrderEndPoint, data: formData);
  }
}
