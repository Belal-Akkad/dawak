import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit([int initialIndex = 0]) : super(initialIndex);

  void select(int index) => emit(index);
}
