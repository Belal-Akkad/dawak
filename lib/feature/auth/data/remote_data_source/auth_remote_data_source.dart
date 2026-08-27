import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/dio_client.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({required DioClient dioClient}) : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<Response<dynamic>> login({
    required String email,
    required String password,
  }) async {
    return await _dioClient.dio.post(
      ApiConstants.loginEndPoint,
      data: {'email': email, 'password': password},
    );
  }

  Future<Response<dynamic>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    return await _dioClient.dio.post(
      ApiConstants.registerEndPoint,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      },
    );
  }

 
}
