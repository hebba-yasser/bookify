import 'package:bloc/bloc.dart';

import '../../data/repos/shared_repo.dart';
import 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.sharedRepo) : super(FetchSimilarBooksInitial());
  final SharedRepo sharedRepo;
  Future<void> FetchSimilarBooks({required String category}) async {
    emit(FetchSimilarBooksLoading());
    var result = await sharedRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(FetchSimilarBooksFailure(failure.errMessage));
    }, (books) {
      emit(FetchSimilarBooksSuccess(books));
    });
  }
}
