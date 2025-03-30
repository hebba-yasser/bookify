import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'fetch_new_arrival_book_states.dart';

class FetchNewArrivalBookCubit extends Cubit<FetchNewArrivalBookStates> {
  FetchNewArrivalBookCubit(this.homeRepo) : super(FetchNewArrivalBookInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewArrivalBook() async {
    emit(FetchNewArrivalBookLoading());
    var result = await homeRepo.fetchNewArrivalsBooks();
    result.fold((failure) {
      emit(FetchNewArrivalBookFailure(failure.errMessage));
    }, (books) {
      emit(FetchNewArrivalBookSuccess(books));
    });
  }
}
