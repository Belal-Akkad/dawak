import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dawak/feature/auth/domain/repo/login_repo.dart';
import 'package:dio/dio.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/core/services/secure_storage_service.dart';
import 'package:dawak/feature/auth/data/remote_data_source/auth_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepo {
  LoginRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required SecureStorageService storage,
  }) : _remoteDataSource = remoteDataSource,
       _storage = storage;

  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorageService _storage;

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      final data = response.data as Map<String, dynamic>;


  
      final accessToken = data['token'] as String;

      await _storage.saveAccessToken(accessToken);

      return const Right(null);
    } on DioException catch (e) {
      return Left(handleDioExceptions(e));
    } catch (e) {

      log(e.toString());
      return const Left(
        ServerFailure(
          message:
          'حدث خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }
}