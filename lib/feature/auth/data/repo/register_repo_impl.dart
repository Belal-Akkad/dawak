import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/core/services/secure_storage_service.dart';
import 'package:dawak/feature/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:dawak/feature/auth/domain/repo/register_repo.dart';

class RegisterRepositoryImpl implements RegisterRepo {
  RegisterRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required SecureStorageService storage,
  }) : _remoteDataSource = remoteDataSource,
       _storage = storage;

  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorageService _storage;

  @override
  Future<Either<Failure, void>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.register(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );

      final data = response.data as Map<String, dynamic>;



      final token = data['token'] as String;


    
      await _storage.saveAccessToken(token);

      return const Right(null);
    } on DioException catch (e) {
      return Left(handleDioExceptions(e));
    } catch (_) {
      return const Left(
        ServerFailure(
          message:
              'حدث خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }
}