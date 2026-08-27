import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';
import 'package:dawak/feature/profile/domain/use_case/get_profile_use_case.dart';
import 'package:dawak/feature/profile/presentation/manager/get_profile_cubit/get_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit({
    required GetProfileUseCase getProfileUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        super(GetProfileInitial());

  final GetProfileUseCase _getProfileUseCase;

  Future<void> getProfile() async {
    emit(GetProfileLoading());

    final result = await _getProfileUseCase();

    result.fold(
      (failure) {
        emit(GetProfileFailure(
          message: failure.message,
        ));
      },
      (profile) {
        emit(GetProfileSuccess(
          profile: profile,
        ));
      },
    );
  }

  void updateProfileState(ProfileEntity profile) {
    emit(GetProfileSuccess(profile: profile));
  }
}