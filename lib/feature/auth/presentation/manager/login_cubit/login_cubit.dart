import 'package:dawak/feature/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/feature/auth/domain/use_case/login_use_case.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required LoginUseCase loginUseCase,
  }) : _loginUseCase = loginUseCase,
       super(LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await _loginUseCase(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess()),
    );
  }
}