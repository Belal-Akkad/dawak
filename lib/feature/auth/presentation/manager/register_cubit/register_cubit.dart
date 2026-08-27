import 'package:dawak/feature/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawak/feature/auth/domain/use_case/register_use_case.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required RegisterUseCase registerUseCase,
  }) : _registerUseCase = registerUseCase,
       super(RegisterInitial());

  final RegisterUseCase _registerUseCase;

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    final result = await _registerUseCase(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (user) => emit(RegisterSuccess()),
    );
  }
}