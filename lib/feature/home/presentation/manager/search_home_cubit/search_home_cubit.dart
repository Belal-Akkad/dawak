import 'package:dawak/feature/home/domain/use_case/search_home_use_case.dart';
import 'package:dawak/feature/home/presentation/manager/search_home_cubit/search_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHomeCubit extends Cubit<SearchHomeState> {
  final SearchHomeUseCase searchHomeUseCase;
  String _lastQuery = '';

  SearchHomeCubit(this.searchHomeUseCase)
      : super(SearchHomeInitial());

  Future<void> searchProducts(String query) async {
    final trimmedQuery = query.trim();

    if (trimmedQuery.isEmpty) {
      _lastQuery = '';
      emit(SearchHomeInitial());
      return;
    }

    _lastQuery = trimmedQuery;
    emit(SearchHomeLoading());

    final result = await searchHomeUseCase(trimmedQuery);

    result.fold(
      (failure) {
        emit(SearchHomeFailure(failure.message));
      },
      (products) {
        if (products.isEmpty) {
          emit(SearchHomeEmpty());
        } else {
          emit(SearchHomeSuccess(products));
        }
      },
    );
  }

  void clearSearch() {
    _lastQuery = '';
    emit(SearchHomeInitial());
  }

  void retrySearch() {
    if (_lastQuery.isNotEmpty) {
      searchProducts(_lastQuery);
    }
  }
}