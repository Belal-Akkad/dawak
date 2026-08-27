import 'package:dawak/feature/profile/domain/repo/logout_repo.dart';

class LogoutUseCase {
  LogoutUseCase(this.repository);

  final LogoutRepository repository;

  Future<void> call() {
    return repository.logout();
  }
}