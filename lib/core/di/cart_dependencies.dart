import 'package:dawak/feature/cart/data/remote_data_source/add_order_remote_data_source.dart';
import 'package:dawak/feature/cart/data/repo/add_order_repo_impl.dart';
import 'package:dawak/feature/cart/domain/repo/add_order_repo.dart';
import 'package:dawak/feature/cart/domain/use_case/add_order_use_case.dart';
import 'package:dawak/feature/cart/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:get_it/get_it.dart';

void registerCartDependencies() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<AddOrdersRemoteDataSource>(
    () => AddOrdersRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<AddOrderRepository>(
    () => AddOrderRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<AddOrderUseCase>(() => AddOrderUseCase(sl()));

  sl.registerFactory<AddOrderCubit>(() => AddOrderCubit(sl()));
}
