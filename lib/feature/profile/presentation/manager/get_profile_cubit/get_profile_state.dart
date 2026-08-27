
import 'package:dawak/feature/profile/domain/entity/profile_entity.dart';

abstract class GetProfileState {
  const GetProfileState();
}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState {}

class GetProfileSuccess extends GetProfileState {
  final ProfileEntity profile;

  const GetProfileSuccess({
    required this.profile,
  });
}

class GetProfileFailure extends GetProfileState {
  final String message;

  const GetProfileFailure({
    required this.message,
  });
}