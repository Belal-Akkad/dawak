import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/services/secure_storage_service.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required SecureStorageService secureStorage,
  }) : _secureStorage = secureStorage;

  final SecureStorageService _secureStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await _secureStorage.getAccessToken();

    final bool isPublic =
        options.path == ApiConstants.registerEndPoint ||
        options.path == ApiConstants.loginEndPoint;

    options.headers['Accept'] = 'application/json';

    if (!isPublic && token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.baseUrl = ApiConstants.baseUrl;

    return handler.next(options);
  }
}