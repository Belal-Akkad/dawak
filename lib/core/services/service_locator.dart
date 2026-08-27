import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

// Core
import 'secure_storage_service.dart';
import 'package:dawak/core/network/auth_interceptor.dart';
import 'package:dawak/core/network/dio_client.dart';

// Auth - Data
import 'package:dawak/feature/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:dawak/feature/auth/data/repo/login_repo_impl.dart';
import 'package:dawak/feature/auth/data/repo/register_repo_impl.dart';

// Auth - Domain
import 'package:dawak/feature/auth/domain/repo/login_repo.dart';
import 'package:dawak/feature/auth/domain/repo/register_repo.dart';
import 'package:dawak/feature/auth/domain/use_case/login_use_case.dart';
import 'package:dawak/feature/auth/domain/use_case/register_use_case.dart';

// Auth - Presentation
import 'package:dawak/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:dawak/feature/auth/presentation/manager/register_cubit/register_cubit.dart';

// Profile - Data
import 'package:dawak/feature/profile/data/remote_data_source/profile_remote_data_source.dart';
import 'package:dawak/feature/profile/data/repo/delete_account_repo_impl.dart';
import 'package:dawak/feature/profile/data/repo/get_profile_repo_impl.dart';
import 'package:dawak/feature/profile/data/repo/logout_repo_impl.dart';
import 'package:dawak/feature/profile/data/repo/update_profile_repo_impl.dart';

// Profile - Domain
import 'package:dawak/feature/profile/domain/repo/delete_account_repo.dart';
import 'package:dawak/feature/profile/domain/repo/get_profile_repo.dart';
import 'package:dawak/feature/profile/domain/repo/logout_repo.dart';
import 'package:dawak/feature/profile/domain/repo/update_profile_repo.dart';

import 'package:dawak/feature/profile/domain/use_case/delete_account_use_case.dart';
import 'package:dawak/feature/profile/domain/use_case/get_profile_use_case.dart';
import 'package:dawak/feature/profile/domain/use_case/logout_use_case.dart';
import 'package:dawak/feature/profile/domain/use_case/update_profile_use_case.dart';

// Profile - Presentation
import 'package:dawak/feature/profile/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ============================================================
  // Core
  // ============================================================

  // Secure Storage
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  sl.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(
      storage: sl(),
    ),
  );

  // Network
  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(
      secureStorage: sl(),
    ),
  );

  sl.registerLazySingleton<DioClient>(
    () => DioClient(
      sl(),
    ),
  );

  sl.registerLazySingleton<Dio>(
    () => sl<DioClient>().dio,
  );

  // ============================================================
  // Auth
  // ============================================================

  // ----------------------------
  // Remote Data Source
  // ----------------------------

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      dioClient: sl(),
    ),
  );

  // ----------------------------
  // Register
  // ----------------------------

  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepositoryImpl(
      remoteDataSource: sl(),
      storage: sl(),
    ),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(
      registerUseCase: sl(),
    ),
  );

  // ----------------------------
  // Login
  // ----------------------------

  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepositoryImpl(
      remoteDataSource: sl(),
      storage: sl(),
    ),
  );

  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      loginUseCase: sl(),
    ),
  );

  // ============================================================
  // Profile
  // ============================================================

  // ----------------------------
  // Remote Data Source
  // ----------------------------

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(
      dioClient: sl(),
    ),
  );

  // ----------------------------
  // Get Profile
  // ----------------------------

  sl.registerLazySingleton<GetProfileRepository>(
    () => GetProfileRepositoryImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<GetProfileUseCase>(
    () => GetProfileUseCase(
      sl(),
    ),
  );

  sl.registerFactory<GetProfileCubit>(
    () => GetProfileCubit(
      getProfileUseCase: sl(),
    ),
  );

  // ----------------------------
  // Update Profile
  // ----------------------------

  sl.registerLazySingleton<UpdateProfileRepository>(
    () => UpdateProfileRepositoryImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(
      sl(),
    ),
  );

  sl.registerFactory<UpdateProfileCubit>(
    () => UpdateProfileCubit(
      updateProfileUseCase: sl(),
    ),
  );

  // ----------------------------
  // Logout
  // ----------------------------

  sl.registerLazySingleton<LogoutRepository>(
    () => LogoutRepositoryImpl(
      remoteDataSource: sl(),
      storage: sl(),
    ),
  );

  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(
      sl(),
    ),
  );

  sl.registerFactory<LogoutCubit>(
    () => LogoutCubit(
      logoutUseCase: sl(),
    ),
  );

  // ----------------------------
  // Delete Account
  // ----------------------------

  sl.registerLazySingleton<DeleteAccountRepo>(
    () => DeleteAccountRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(
      repository: sl(),
    ),
  );

  sl.registerFactory<DeleteAccountCubit>(
    () => DeleteAccountCubit(
      deleteAccountUseCase: sl(),
    ),
  );
}