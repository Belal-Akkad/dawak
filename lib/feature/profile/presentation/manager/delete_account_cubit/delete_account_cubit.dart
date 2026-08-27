import 'package:dawak/feature/profile/domain/use_case/delete_account_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit({required DeleteAccountUseCase deleteAccountUseCase})
    : _deleteAccountUseCase = deleteAccountUseCase,
      super(const DeleteAccountInitial());

  final DeleteAccountUseCase _deleteAccountUseCase;

  Future<void> deleteAccount() async {
    emit(const DeleteAccountLoading());

    final result = await _deleteAccountUseCase();

    result.fold(
      (failure) {
        emit(DeleteAccountFailure(message: failure.message));
      },
      (_) {
        emit(const DeleteAccountSuccess());
      },
    );
  }
}
