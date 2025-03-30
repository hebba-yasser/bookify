import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'fetch_books_by_author_name_states.dart';

class FetchBooksByAuthorNameCubit extends Cubit<FetchBooksByAuthorNameStates> {
  FetchBooksByAuthorNameCubit(this.homeRepo)
      : super(FetchBooksByAuthorNameInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBooksByAuthorName({required String authorName}) async {
    emit(FetchBooksByAuthorNameLoading());
    var result = await homeRepo.fetchBooksByAuthorName(authorName: authorName);
    result.fold((failure) {
      emit(FetchBooksByAuthorNameFailure(failure.errMessage));
    }, (books) {
      emit(FetchBooksByAuthorNameSuccess(books));
    });
  }
}
