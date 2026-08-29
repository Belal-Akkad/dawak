
import 'package:dawak/feature/home/domain/entity/home_entity.dart';

abstract class GetHomeState {
  const GetHomeState();
}

class GetHomeInitial extends GetHomeState {
  const GetHomeInitial();
}

class GetHomeLoading extends GetHomeState {
  const GetHomeLoading();
}

class GetHomeSuccess extends GetHomeState {
  final HomeEntity home;

  const GetHomeSuccess({
    required this.home,
  });
}

class GetHomeFailure extends GetHomeState {
  final String message;

  const GetHomeFailure({
    required this.message,
  });
}