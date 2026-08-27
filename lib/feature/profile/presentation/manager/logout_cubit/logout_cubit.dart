import 'package:dawak/feature/profile/domain/use_case/logout_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required LogoutUseCase logoutUseCase})
    : _logoutUseCase = logoutUseCase,
      super(LogoutInitial());

  final LogoutUseCase _logoutUseCase;

  Future<void> logout() async {
    emit(LogoutLoading());

    try {
      await _logoutUseCase();

      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure('تعذر حذف بيانات تسجيل الدخول.'));
    }
  }
}
