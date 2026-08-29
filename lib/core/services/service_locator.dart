import 'package:dawak/feature/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:dawak/feature/home/data/remote_data_source/search_home_remote_data_source.dart';
import 'package:dawak/feature/home/data/repo/get_home_repo_impl.dart';
import 'package:dawak/feature/home/data/repo/search_home_repo_impl.dart';
import 'package:dawak/feature/home/domain/repo/get_home_repo.dart';
import 'package:dawak/feature/home/domain/repo/search_home_repo.dart';
import 'package:dawak/feature/home/domain/use_case/get_home_use_case.dart';
import 'package:dawak/feature/home/domain/use_case/search_home_use_case.dart';
import 'package:dawak/feature/home/presentation/manager/get_home_cubit/get_home_cubit.dart';
import 'package:dawak/feature/home/presentation/manager/search_home_cubit/search_home_cubit.dart';
import 'package:dawak/feature/product_details/data/remote_data_source/product_details_remote_data_source.dart';
import 'package:dawak/feature/product_details/data/repo/product_details_repo_impl.dart';
import 'package:dawak/feature/product_details/domain/repo/product_details_repo.dart';
import 'package:dawak/feature/product_details/domain/use_case/get_product_details_use_case.dart';
import 'package:dawak/feature/product_details/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:dawak/feature/products/data/remote_data_source/products_remote_data_source.dart';
import 'package:dawak/feature/products/data/repo/products_repo_impl.dart';
import 'package:dawak/feature/products/domain/repo/products_repo.dart';
import 'package:dawak/feature/products/domain/use_case/get_products_use_case.dart';
import 'package:dawak/feature/products/presentation/manager/products_cubit.dart';
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

// Categories - Data
import 'package:dawak/feature/categories/data/remote_data_source/categories_remote_data_source.dart';
import 'package:dawak/feature/categories/data/repo/categories_repository_impl.dart';

// Categories - Domain
import 'package:dawak/feature/categories/domain/repo/categories_repository.dart';
import 'package:dawak/feature/categories/domain/use_case/get_categories_use_case.dart';

// Categories - Presentation
import 'package:dawak/feature/categories/presentation/manager/categories_cubit/categories_cubit.dart';

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
    () => SecureStorageService(storage: sl()),
  );

  // Network
  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(secureStorage: sl()),
  );

  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));

  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);

  // ============================================================
  // Auth
  // ============================================================

  // ----------------------------
  // Remote Data Source
  // ----------------------------

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(dioClient: sl()),
  );

  // ----------------------------
  // Register
  // ----------------------------

  sl.registerLazySingleton<RegisterRepo>(
    () => RegisterRepositoryImpl(remoteDataSource: sl(), storage: sl()),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(repository: sl()),
  );

  sl.registerFactory<RegisterCubit>(() => RegisterCubit(registerUseCase: sl()));

  // ----------------------------
  // Login
  // ----------------------------

  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepositoryImpl(remoteDataSource: sl(), storage: sl()),
  );

  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: sl()));

  sl.registerFactory<LoginCubit>(() => LoginCubit(loginUseCase: sl()));

  // ============================================================
  // Profile
  // ============================================================

  // ----------------------------
  // Remote Data Source
  // ----------------------------

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(dioClient: sl()),
  );

  // ----------------------------
  // Get Profile
  // ----------------------------

  sl.registerLazySingleton<GetProfileRepository>(
    () => GetProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));

  sl.registerFactory<GetProfileCubit>(
    () => GetProfileCubit(getProfileUseCase: sl()),
  );

  // ----------------------------
  // Update Profile
  // ----------------------------

  sl.registerLazySingleton<UpdateProfileRepository>(
    () => UpdateProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(sl()),
  );

  sl.registerFactory<UpdateProfileCubit>(
    () => UpdateProfileCubit(updateProfileUseCase: sl()),
  );

  // ----------------------------
  // Logout
  // ----------------------------

  sl.registerLazySingleton<LogoutRepository>(
    () => LogoutRepositoryImpl(remoteDataSource: sl(), storage: sl()),
  );

  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));

  sl.registerFactory<LogoutCubit>(() => LogoutCubit(logoutUseCase: sl()));

  // ----------------------------
  // Delete Account
  // ----------------------------

  sl.registerLazySingleton<DeleteAccountRepo>(
    () => DeleteAccountRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(repository: sl()),
  );

  sl.registerFactory<DeleteAccountCubit>(
    () => DeleteAccountCubit(deleteAccountUseCase: sl()),
  );

  // ============================================================
  // Categories
  // ============================================================

  // ----------------------------
  // Remote Data Source
  // ----------------------------

  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSource(dioClient: sl()),
  );

  // ----------------------------
  // Get Categories
  // ----------------------------

  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl()),
  );

  sl.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getCategoriesUseCase: sl()),
  );

  // ----------------------------
  // Get Home
  // ----------------------------

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<GetHomeRepository>(
    () => GetHomeRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetHomeUseCase>(() => GetHomeUseCase(sl()));

  sl.registerFactory<GetHomeCubit>(() => GetHomeCubit(getHomeUseCase: sl()));

  // ----------------------------
  // Get Products
  // ----------------------------

  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(sl()));

  sl.registerFactory<ProductsCubit>(
    () => ProductsCubit(getProductsUseCase: sl()),
  );

  // ----------------------------
  // Search Home
  // ----------------------------

  sl.registerLazySingleton<SearchHomeRemoteDataSource>(
    () => SearchHomeRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<SearchHomeRepository>(
    () => SearchHomeRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<SearchHomeUseCase>(() => SearchHomeUseCase(sl()));

  sl.registerFactory<SearchHomeCubit>(() => SearchHomeCubit(sl()));

  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProductDetailsUseCase>(
    () => GetProductDetailsUseCase(sl()),
  );

  sl.registerFactory<ProductDetailsCubit>( 
    () => ProductDetailsCubit(sl()));
}
