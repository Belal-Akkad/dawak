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
import 'package:get_it/get_it.dart';

void registerHomeDependencies() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<GetHomeRepository>(
    () => GetHomeRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetHomeUseCase>(() => GetHomeUseCase(sl()));

  sl.registerFactory<GetHomeCubit>(() => GetHomeCubit(getHomeUseCase: sl()));

  sl.registerLazySingleton<SearchHomeRemoteDataSource>(
    () => SearchHomeRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<SearchHomeRepository>(
    () => SearchHomeRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<SearchHomeUseCase>(() => SearchHomeUseCase(sl()));

  sl.registerFactory<SearchHomeCubit>(() => SearchHomeCubit(sl()));
}
