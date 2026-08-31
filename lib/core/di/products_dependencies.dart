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
import 'package:get_it/get_it.dart';

void registerProductsDependencies() {
  final sl = GetIt.instance;

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

  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProductDetailsUseCase>(
    () => GetProductDetailsUseCase(sl()),
  );

  sl.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit(sl()));
}
