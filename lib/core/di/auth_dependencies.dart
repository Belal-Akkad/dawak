import 'package:dawak/feature/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:dawak/feature/auth/data/repo/login_repo_impl.dart';
import 'package:dawak/feature/auth/data/repo/register_repo_impl.dart';
import 'package:dawak/feature/auth/domain/repo/login_repo.dart';
import 'package:dawak/feature/auth/domain/repo/register_repo.dart';
import 'package:dawak/feature/auth/domain/use_case/login_use_case.dart';
import 'package:dawak/feature/auth/domain/use_case/register_use_case.dart';
import 'package:dawak/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:dawak/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

void registerAuthDependencies() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepositoryImpl(remoteDataSource: sl(), storage: sl()),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(repository: sl()),
  );

  sl.registerFactory<RegisterCubit>(() => RegisterCubit(registerUseCase: sl()));

  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepositoryImpl(remoteDataSource: sl(), storage: sl()),
  );

  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: sl()));

  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUseCase: sl()));
}
