import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';

abstract class UpdateProfileState {
  const UpdateProfileState();
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final ProfileEntity profile;

  const UpdateProfileSuccess({
    required this.profile,
  });
}

class UpdateProfileFailure extends UpdateProfileState {
  final String message;

  const UpdateProfileFailure({
    required this.message,
  });
}