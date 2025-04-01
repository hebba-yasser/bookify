import 'package:bloc/bloc.dart';

import '../../../../../core/data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';
import 'fetch_books_by_author_name_states.dart';

// class FetchBooksByAuthorNameCubit extends Cubit<FetchBooksByAuthorNameStates> {
//   FetchBooksByAuthorNameCubit(this.homeRepo)
//       : super(FetchBooksByAuthorNameInitial());
//   final HomeRepo homeRepo;
//   Future<void> fetchBooksByAuthorName({required String authorName}) async {
//     emit(FetchBooksByAuthorNameLoading());
//     var result = await homeRepo.fetchBooksByAuthorName(authorName: authorName);
//     result.fold((failure) {
//       emit(FetchBooksByAuthorNameFailure(failure.errMessage));
//     }, (books) {
//       emit(FetchBooksByAuthorNameSuccess(books));
//     });
//   }
// }
class FetchBooksByAuthorNameCubit extends Cubit<FetchBooksByAuthorNameStates> {
  FetchBooksByAuthorNameCubit(this.homeRepo)
      : super(FetchBooksByAuthorNameInitial());
  final HomeRepo homeRepo;
  List<BookModel> books = [];
  int currentPage = -1;
  bool hasReachedMax = false;
  Future<void> fetchBooksByAuthorName({
    required String authorName,
    bool loadMore = false,
  }) async {
    if (!loadMore) {
      currentPage = -1;
      hasReachedMax = false;
      books.clear();
      emit(FetchBooksByAuthorNameLoading());
    } else {
      if (hasReachedMax) return;
      emit(FetchBooksByAuthorNameLoadingPagination(books));
    }
    var result = await homeRepo.fetchBooksByAuthorName(
      authorName: authorName,
      pageNumber: currentPage + 1,
    );
    result.fold((failure) {
      if (!loadMore) {
        emit(FetchBooksByAuthorNameFailure(failure.errMessage));
      } else {
        emit(
            FetchBooksByAuthorNameFailurePagination(failure.errMessage, books));
      }
    }, (newBooks) {
      if (newBooks.isEmpty) {
        hasReachedMax = true;
      } else {
        currentPage++;
        books.addAll(newBooks);
      }
      emit(FetchBooksByAuthorNameSuccess(books));
    });
  }
}
