import 'package:bloc/bloc.dart';

import '../../../data/repos/search_repo.dart';
import 'fetch_search_states.dart';

class FetchSearchBookCubit extends Cubit<FetchSearchBookStates> {
  FetchSearchBookCubit(this.searchRepo) : super(FetchSearchInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchBook(
      {required String? query,
      String? language,
      String? orderBy,
      String? filter}) async {
    emit(FetchSearchLoading());
    var result = await searchRepo.SearchBooks(
        query: query, language: language, orderBy: orderBy, filter: filter);
    result.fold((failure) {
      emit(FetchSearchFailure(failure.errMessage));
    }, (books) {
      emit(FetchSearchSuccess(books));
    });
  }
}
