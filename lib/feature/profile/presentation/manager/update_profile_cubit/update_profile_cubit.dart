import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dawak/feature/profile/domain/use_case/update_profile_use_case.dart';
import 'package:dawak/feature/profile/presentation/manager/update_profile_cubit/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({
    required UpdateProfileUseCase updateProfileUseCase,
  })  : _updateProfileUseCase = updateProfileUseCase,
        super(UpdateProfileInitial());

  final UpdateProfileUseCase _updateProfileUseCase;

  Future<void> updateProfile({
    required String name,
    required String phone,
  }) async {
    emit(UpdateProfileLoading());

    final result = await _updateProfileUseCase(
      name: name,
      phone: phone,
    );

    result.fold(
      (failure) {
        emit(
          UpdateProfileFailure(
            message: failure.message,
          ),
        );
      },
      (profile) {
        emit(
          UpdateProfileSuccess(
            profile: profile,
          ),
        );
      },
    );
  }
}