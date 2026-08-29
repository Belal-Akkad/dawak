import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/home/data/model/home_model.dart';

class HomeRemoteDataSource {
  HomeRemoteDataSource({required DioClient dioClient})
    : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<HomeModel> getHome() async {
    final response = await _dioClient.dio.get(
      ApiConstants.homeEndPoint,
    );

    final data = response.data['data'] as Map<String, dynamic>;

    return HomeModel.fromJson(data);
  }
}