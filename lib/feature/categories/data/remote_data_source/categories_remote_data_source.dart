import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/categories/data/model/category_model.dart';

class CategoriesRemoteDataSource {
  CategoriesRemoteDataSource({required DioClient dioClient})
    : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<List<CategoryModel>> getCategories() async {
    final response = await _dioClient.dio.get(ApiConstants.categoriesEndPoint);
    final data = response.data['data'] as List;

    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }
}
