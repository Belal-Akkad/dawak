import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/products/data/models/product_model.dart';

class ProductsRemoteDataSource {
  ProductsRemoteDataSource({required DioClient dioClient})
      : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<List<ProductModel>> getProducts(String endpoint) async {
    final response = await _dioClient.dio.get(endpoint);

    final data = response.data['data'] as List;

    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}