import 'package:dawak/feature/profile/data/remote_data_source/profile_remote_data_source.dart';
import 'package:dawak/feature/profile/data/repo/delete_account_repo_impl.dart';
import 'package:dawak/feature/profile/data/repo/get_profile_repo_impl.dart';
import 'package:dawak/feature/profile/data/repo/logout_repo_impl.dart';
import 'package:dawak/feature/profile/data/repo/update_profile_repo_impl.dart';
import 'package:dawak/feature/profile/domain/repo/delete_account_repo.dart';
import 'package:dawak/feature/profile/domain/repo/get_profile_repo.dart';
import 'package:dawak/feature/profile/domain/repo/logout_repo.dart';
import 'package:dawak/feature/profile/domain/repo/update_profile_repo.dart';
import 'package:dawak/feature/profile/domain/use_case/delete_account_use_case.dart';
import 'package:dawak/feature/profile/domain/use_case/get_profile_use_case.dart';
import 'package:dawak/feature/profile/domain/use_case/logout_use_case.dart';
import 'package:dawak/feature/profile/domain/use_case/update_profile_use_case.dart';
import 'package:dawak/feature/profile/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:dawak/feature/profile/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:get_it/get_it.dart';

void registerProfileDependencies() {
  final sl = GetIt.instance;

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<GetProfileRepository>(
    () => GetProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));

  sl.registerFactory<GetProfileCubit>(
    () => GetProfileCubit(getProfileUseCase: sl()),
  );

  sl.registerLazySingleton<UpdateProfileRepository>(
    () => UpdateProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(sl()),
  );

  sl.registerFactory<UpdateProfileCubit>(
    () => UpdateProfileCubit(updateProfileUseCase: sl()),
  );

  sl.registerLazySingleton<LogoutRepository>(
    () => LogoutRepositoryImpl(remoteDataSource: sl(), storage: sl()),
  );

  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));

  sl.registerFactory<LogoutCubit>(() => LogoutCubit(logoutUseCase: sl()));

  sl.registerLazySingleton<DeleteAccountRepo>(
    () => DeleteAccountRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(repository: sl()),
  );

  sl.registerFactory<DeleteAccountCubit>(
    () => DeleteAccountCubit(deleteAccountUseCase: sl()),
  );
}
