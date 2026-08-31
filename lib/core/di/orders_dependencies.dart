import 'package:dawak/core/services/service_locator.dart';
import 'package:dawak/feature/order/data/remote_data_source/orders_remote_data_source.dart';
import 'package:dawak/feature/order/data/repo/get_order_details_repo_impl.dart';
import 'package:dawak/feature/order/data/repo/get_orders_repo_impl.dart';
import 'package:dawak/feature/order/domain/repo/get_order_details_repo.dart';
import 'package:dawak/feature/order/domain/repo/get_orders_repo.dart';
import 'package:dawak/feature/order/domain/use_case/get_order_details_use_case.dart';
import 'package:dawak/feature/order/domain/use_case/get_orders_use_case.dart';
import 'package:dawak/feature/order/presentation/manager/get_order_details_cubit/get_order_details_cubit.dart';
import 'package:dawak/feature/order/presentation/manager/get_orders_cubit/get_orders_cubit.dart';

void registerOrdersDependencies() {

  sl.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSource(dioClient: sl()),
  );


  sl.registerLazySingleton<GetOrdersRepository>(
    () => GetOrdersRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(sl()),
  );

  sl.registerFactory<GetOrdersCubit>(
    () => GetOrdersCubit(getOrdersUseCase: sl()),
  );


  sl.registerLazySingleton<GetOrderDetailsRepository>(
    () => GetOrderDetailsRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetOrderDetailsUseCase>(
    () => GetOrderDetailsUseCase(sl()),
  );

  sl.registerFactory<GetOrderDetailsCubit>(
    () => GetOrderDetailsCubit(sl()),
  );
}