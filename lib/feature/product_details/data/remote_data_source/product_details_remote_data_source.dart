import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/product_details/data/model/product_details_model.dart';

class ProductDetailsRemoteDataSource {
  ProductDetailsRemoteDataSource({required DioClient dioClient})
      : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<ProductDetailsModel> getProductDetails(String endpoint) async {
    final response = await _dioClient.dio.get(endpoint);

    final data = response.data['data'] as Map<String, dynamic>;

    return ProductDetailsModel.fromJson(data);
  }
}