

import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/auth_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient(this._authInterceptor) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,

        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        responseType: ResponseType.json,
      ),
    )..interceptors.add(_authInterceptor);
  }

  late final Dio dio;
  final AuthInterceptor _authInterceptor;
}