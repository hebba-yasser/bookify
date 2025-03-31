import '../../../../../core/data/models/book_model/book_model.dart';

sealed class FetchNewArrivalBookStates {}

final class FetchNewArrivalBookInitial extends FetchNewArrivalBookStates {}

final class FetchNewArrivalBookLoading extends FetchNewArrivalBookStates {}

final class FetchNewArrivalBookSuccess extends FetchNewArrivalBookStates {
  final List<BookModel> books;
  FetchNewArrivalBookSuccess(this.books);
}

final class FetchNewArrivalBookFailure extends FetchNewArrivalBookStates {
  final String errMessage;
  FetchNewArrivalBookFailure(this.errMessage);
}

final class FetchNewArrivalBookLoadingPagination
    extends FetchNewArrivalBookStates {}

final class FetchNewArrivalBookFailurePagination
    extends FetchNewArrivalBookStates {
  final String errMessage;
  FetchNewArrivalBookFailurePagination(this.errMessage);
}
