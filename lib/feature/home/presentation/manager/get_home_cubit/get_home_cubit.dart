import 'package:dawak/feature/home/presentation/manager/get_home_cubit/get_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/feature/home/domain/use_case/get_home_use_case.dart';


class GetHomeCubit extends Cubit<GetHomeState> {
  GetHomeCubit({
    required GetHomeUseCase getHomeUseCase,
  }) : _getHomeUseCase = getHomeUseCase,
       super(const GetHomeInitial());

  final GetHomeUseCase _getHomeUseCase;

  Future<void> getHome() async {
    emit(const GetHomeLoading());

    final result = await _getHomeUseCase();

    result.fold(
      (failure) => emit(GetHomeFailure(message: failure.message)),
      (home) => emit(GetHomeSuccess(home: home)),
    );
  }
}