import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'fetch_new_arrival_book_states.dart';

class FetchNewArrivalBookCubit extends Cubit<FetchNewArrivalBookStates> {
  FetchNewArrivalBookCubit(this.homeRepo) : super(FetchNewArrivalBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewArrivalBook({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchNewArrivalBookLoading());
    } else {
      emit(FetchNewArrivalBookLoadingPagination());
    }
    var result = await homeRepo.fetchNewArrivalsBooks(pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FetchNewArrivalBookFailure(failure.errMessage));
      } else {
        emit(FetchNewArrivalBookFailurePagination(failure.errMessage));
      }
    }, (books) {
      emit(FetchNewArrivalBookSuccess(books));
    });
  }
}
