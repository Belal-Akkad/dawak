import 'package:dawak/feature/categories/domain/use_case/get_categories_use_case.dart';
import 'package:dawak/feature/categories/presentation/manager/categories_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({
    required GetCategoriesUseCase getCategoriesUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        super(CategoriesInitial());

  final GetCategoriesUseCase _getCategoriesUseCase;

  Future<void> getCategories() async {
    emit(CategoriesLoading());

    final result = await _getCategoriesUseCase();

    result.fold(
      (failure) => emit(CategoriesFailure(message: failure.message)),
      (categories) => emit(CategoriesSuccess(categories: categories)),
    );
  }
}
