import 'package:bloc/bloc.dart';

import '../../../data/repos/search_repo.dart';
import '../update_recent_search_cubit/update_recent_search_cubit.dart';
import 'fetch_search_states.dart';

class FetchSearchBookCubit extends Cubit<FetchSearchBookStates> {
  FetchSearchBookCubit(this.searchRepo, this.updateRecentSearchCubit)
      : super(FetchSearchInitial());
  final SearchRepo searchRepo;
  final UpdateRecentSearchCubit updateRecentSearchCubit;
  String query = '';

  Future<void> fetchSearchBook(
      {required String query,
      String? language,
      String? orderBy,
      String? filter}) async {
    this.query = query;
    emit(FetchSearchLoading());
    var result = await searchRepo.SearchBooks(
        query: query, language: language, orderBy: orderBy, filter: filter);
    result.fold((failure) {
      emit(FetchSearchFailure(failure.errMessage));
    }, (books) async {
      await updateRecentSearchCubit.updateRecentSearch(search: query);
      emit(FetchSearchSuccess(books));
    });
  }
}
