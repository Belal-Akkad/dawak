import 'package:dawak/feature/categories/data/remote_data_source/categories_remote_data_source.dart';
import 'package:dawak/feature/categories/data/repo/categories_repository_impl.dart';
import 'package:dawak/feature/categories/domain/repo/categories_repository.dart';
import 'package:dawak/feature/categories/domain/use_case/get_categories_use_case.dart';
import 'package:dawak/feature/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:get_it/get_it.dart';

void registerCategoriesDependencies() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl()),
  );

  sl.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getCategoriesUseCase: sl()),
  );
}
