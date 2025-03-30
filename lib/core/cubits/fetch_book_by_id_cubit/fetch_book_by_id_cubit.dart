import 'package:bloc/bloc.dart';

import '../../data/repos/shared_repo.dart';
import 'fetch_book_by_id_state.dart';

class FetchBookByIdCubit extends Cubit<FetchBookByIdState> {
  FetchBookByIdCubit(this.sharedRepo) : super(FetchBookByIdInitial());
  final SharedRepo sharedRepo;
  Future<void> FetchBookById({required String id}) async {
    emit(FetchBookByIdLoading());
    var result = await sharedRepo.fetchBookById(id: id);
    result.fold((failure) {
      emit(FetchBookByIdFailure(failure.errMessage));
    }, (books) {
      emit(FetchBookByIdSuccess(books));
    });
  }
}
