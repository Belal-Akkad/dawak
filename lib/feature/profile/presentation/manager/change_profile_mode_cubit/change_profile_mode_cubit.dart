import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeProfileModeCubit extends Cubit<bool> {
  ChangeProfileModeCubit() : super(false);

  void enterEditMode() {
    emit(true);
  }

  void exitEditMode() {
    emit(false);
  }

  void toggleEditMode() {
    emit(!state);
  }
}