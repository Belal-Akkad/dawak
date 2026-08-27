import 'package:dawak/core/services/secure_storage_service.dart';
import 'package:dawak/feature/profile/data/remote_data_source/profile_remote_data_source.dart';
import 'package:dawak/feature/profile/domain/repo/logout_repo.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  LogoutRepositoryImpl({
    required ProfileRemoteDataSource remoteDataSource,
    required SecureStorageService storage,
  }) : _remoteDataSource = remoteDataSource,
       _storage = storage;

  final ProfileRemoteDataSource _remoteDataSource;
  final SecureStorageService _storage;

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } catch (_) {}

    await _storage.clearTokens();
  }
}
