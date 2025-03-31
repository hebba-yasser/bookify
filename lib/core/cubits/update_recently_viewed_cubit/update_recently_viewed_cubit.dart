import 'package:bloc/bloc.dart';
import 'package:bookify/core/cubits/update_recently_viewed_cubit/update_recently_viewed_state.dart';
import 'package:bookify/core/data/models/user_model/small_book_model.dart';
import 'package:bookify/core/data/repos/shared_repo.dart';

class UpdateRecentlyViewedCubit extends Cubit<UpdateRecentlyViewedState> {
  UpdateRecentlyViewedCubit(
    this.sharedRepo,
  ) : super(UpdateRecentlyViewedInitial());
  final SharedRepo sharedRepo;
  Future<void> UpdateRecentlyViewed({required SmallBookModel book}) async {
    emit(UpdateRecentlyViewedLoading());
    var result = await sharedRepo.updateUserRecentlyViewedList(book: book);
    result.fold((failure) {
      print(failure.errMessage);
      emit(UpdateRecentlyViewedFailure(failure.errMessage));
    }, (r) async {
      emit(UpdateRecentlyViewedSuccess());
    });
  }
}
