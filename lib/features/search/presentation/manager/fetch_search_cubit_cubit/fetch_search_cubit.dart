import 'package:bloc/bloc.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';
import '../update_recent_search_cubit/update_recent_search_cubit.dart';
import 'fetch_search_states.dart';

class FetchSearchBookCubit extends Cubit<FetchSearchBookStates> {
  FetchSearchBookCubit(this.searchRepo, this.updateRecentSearchCubit)
      : super(FetchSearchInitial());

  final SearchRepo searchRepo;
  final UpdateRecentSearchCubit updateRecentSearchCubit;

  String currentQuery = '';
  List<BookModel> books = [];
  int currentPage = -1;
  bool hasReachedMax = false;

  Future<void> fetchSearchBook({
    required String query,
    bool loadMore = false,
    String? language,
    String? orderBy,
    String? filter,
  }) async {
    if (!loadMore) {
      currentQuery = query;
      currentPage = -1;
      hasReachedMax = false;
      books.clear();
      emit(FetchSearchLoading());
    } else {
      if (hasReachedMax) return;
      emit(FetchSearchLoadingPagination(books));
    }

    final result = await searchRepo.SearchBooks(
      query: currentQuery,
      pageNumber: currentPage + 1,
      language: language,
      filter: filter,
      orderBy: orderBy,
    );

    result.fold(
      (failure) {
        if (!loadMore) {
          emit(FetchSearchFailure(failure.errMessage));
        } else {
          emit(FetchSearchFailurePagination(failure.errMessage, books));
        }
      },
      (newBooks) async {
        if (newBooks.isEmpty) {
          hasReachedMax = true;
        } else {
          currentPage++;
          books.addAll(newBooks);
        }
        if (!loadMore) {
          await updateRecentSearchCubit.updateRecentSearch(search: query);
        }
        for (var book in books) {
          print(book.id);
        }
        emit(FetchSearchSuccess(books));
      },
    );
  }
}
