import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/products/data/models/product_model.dart';

class SearchHomeRemoteDataSource {
  SearchHomeRemoteDataSource({required DioClient dioClient})
    : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<List<ProductModel>> searchProducts(String query) async {
    final response = await _dioClient.dio.get(
      ApiConstants.searchProductsEndPoint,
      queryParameters: {
        'q': query,
      },
    );

    final data = response.data['data'] as List;

    return data
        .map(
          (json) => ProductModel.fromJson(
            json as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}